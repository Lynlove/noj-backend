package com.yupi.noj.judge;

import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;

import cn.hutool.json.JSONUtil;
import com.yupi.noj.common.ErrorCode;
import com.yupi.noj.exception.BusinessException;
import com.yupi.noj.judge.codesandbox.CodeSandbox;
import com.yupi.noj.judge.codesandbox.CodeSandboxFactory;
import com.yupi.noj.judge.codesandbox.CodeSandboxProxy;
import com.yupi.noj.judge.codesandbox.model.ExecuteCodeRequest;
import com.yupi.noj.judge.codesandbox.model.ExecuteCodeResponse;
import com.yupi.noj.judge.strategy.JudgeContext;
import com.yupi.noj.model.dto.question.JudgeCase;
import com.yupi.noj.judge.codesandbox.model.JudgeInfo;
import com.yupi.noj.model.entity.Question;
import com.yupi.noj.model.entity.QuestionSubmit;
import com.yupi.noj.model.enums.JudgeInfoMessageEnum;
import com.yupi.noj.model.enums.QuestionSubmitStatusEnum;
import com.yupi.noj.service.QuestionService;
import com.yupi.noj.service.QuestionSubmitService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * 判题服务（单机）
 */
@Service
@Slf4j
public class JudgeServiceImpl implements JudgeService {

    @Value("${codesandbox.type:example}")
    private String type;
    @Resource
    private QuestionService questionService;

    @Resource
    private QuestionSubmitService questionSubmitService;

    @Resource
    private JudgeManager judgeManager;


    @Override
    public QuestionSubmit doJudge(long questionSubmitId) {
        // 1）传入提交题目的id，获取到对应的题目信息（包含代码，编程语言等）
        QuestionSubmit questionSubmit = questionSubmitService.getById(questionSubmitId);

        if (questionSubmit == null) {
            throw new BusinessException(ErrorCode.NOT_FOUND_ERROR, "提交信息不存在");
        }
        Long questionId = questionSubmit.getQuestionId();
        Question question = questionService.getById(questionId);
        if (question == null) {
            throw new BusinessException(ErrorCode.NOT_FOUND_ERROR, "题目不存在");
        }

        Integer status = questionSubmit.getStatus();

        // 2）校验判题状态 如果是等待中就不用重复执行了
        if (!Objects.equals(status, QuestionSubmitStatusEnum.WAITING.getValue())) {
            throw new BusinessException(ErrorCode.OPERATION_ERROR, "当前题目正在判题中");
        }
        // 3）更改判题状态
        QuestionSubmit questionSubmitUpdate = new QuestionSubmit();
        questionSubmitUpdate.setId(questionSubmitId);

        questionSubmitUpdate.setStatus(QuestionSubmitStatusEnum.RUNNING.getValue());
        boolean update = questionSubmitService.updateById(questionSubmitUpdate);
        if (!update) {
            throw new BusinessException(ErrorCode.SYSTEM_ERROR, "判题状态更新失败");
        }

        // 添加题目提交数
        Question updateQuestion = new Question();
        updateQuestion.setId(questionId);
        Integer submitNum = Optional.ofNullable(question.getSubmitNum()).orElse(0);
        question.setSubmitNum(submitNum + 1);
        questionService.updateById(question);

        // 4）调用沙箱，执行代码，获取执行结果
        CodeSandbox codeSandBox = CodeSandboxFactory.newInstance(type);
        codeSandBox = new CodeSandboxProxy(codeSandBox);

        String language = questionSubmit.getLanguage();
        String code = questionSubmit.getCode();
        String judgeCaseStr = question.getJudgeCase();

        // 解析判题用例
        List<JudgeCase> judgeCaseList = JSONUtil.toList(judgeCaseStr, JudgeCase.class);
        List<String> inputList = judgeCaseList.stream().map(JudgeCase::getInput).collect(Collectors.toList());

        ExecuteCodeRequest executeCodeRequest = ExecuteCodeRequest.builder()
                .code(code).language(language).inputList(inputList).build();
        ExecuteCodeResponse executeCodeResponse = codeSandBox.executeCode(executeCodeRequest);
        // 5）根据执行结果，设置题目的判题状态和信息
        JudgeContext judgeContext = new JudgeContext();


        judgeContext.setInputList(inputList);
        judgeContext.setOutputList(executeCodeResponse.getOutputList());
        judgeContext.setJudgeInfo(executeCodeResponse.getJudgeInfo());
        judgeContext.setJudgeCaseList(judgeCaseList);
        judgeContext.setQuestion(question);
        judgeContext.setQuestionSubmit(questionSubmit);

        JudgeInfo judgeInfo = judgeManager.doJudge(judgeContext);

        // 更新判题状态
        questionSubmitUpdate = new QuestionSubmit();
        questionSubmitUpdate.setId(questionSubmitId);
        questionSubmitUpdate.setStatus(QuestionSubmitStatusEnum.SUCCESS.getValue());

        questionSubmitUpdate.setJudgeInfo(JSONUtil.toJsonStr(judgeInfo));
        update = questionSubmitService.updateById(questionSubmitUpdate);
        if (!update) {
            throw new BusinessException(ErrorCode.SYSTEM_ERROR, "判题状态更新失败");
        }

        // 如果答案正确，更新题目通过数
        if (JudgeInfoMessageEnum.ACCEPTED.getValue().equals(judgeInfo.getMessage())) {
            Integer acceptedNum = Optional.ofNullable(question.getAcceptedNum()).orElse(0);
            updateQuestion = new Question();
            updateQuestion.setId(questionId);
            question.setAcceptedNum(acceptedNum + 1);
            questionService.updateById(question);
        }

        QuestionSubmit questionSubmitResult = questionSubmitService.getById(questionSubmitId);
        return questionSubmitResult;
    }
}

package com.yupi.noj.judge.codesandbox.impl;
import java.util.List;

import com.yupi.noj.judge.codesandbox.CodeSandbox;
import com.yupi.noj.judge.codesandbox.model.ExecuteCodeRequest;
import com.yupi.noj.judge.codesandbox.model.ExecuteCodeResponse;
import com.yupi.noj.model.dto.questionsubmit.JudgeInfo;
import com.yupi.noj.model.enums.JudgeInfoMessageEnum;
import com.yupi.noj.model.enums.QuestionSubmitStatusEnum;

/**
 * 示例代码沙箱
 */
public class ExampleCodeSandbox implements CodeSandbox {
    @Override
    public ExecuteCodeResponse executeCode(ExecuteCodeRequest executeCodeRequest) {

        System.out.println("ExampleCodeSandBox executeCode");
        List<String> inputList = executeCodeRequest.getInputList();
        String code = executeCodeRequest.getCode();
        String language = executeCodeRequest.getLanguage();
        ExecuteCodeResponse executeCodeResponse = new ExecuteCodeResponse();
        executeCodeResponse.setOutputList(inputList);
        executeCodeResponse.setMessage("测试执行成功");
        executeCodeResponse.setStatus(QuestionSubmitStatusEnum.SUCCESS.getText());
        JudgeInfo judgeInfo = new JudgeInfo();
        judgeInfo.setMessage(JudgeInfoMessageEnum.ACCEPTED.getText());
        judgeInfo.setMemory(100L);
        judgeInfo.setTime(100L);

        executeCodeResponse.setJudgeInfo(judgeInfo);
        return executeCodeResponse;
    }
}

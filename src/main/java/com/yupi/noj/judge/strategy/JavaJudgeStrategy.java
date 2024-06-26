package com.yupi.noj.judge.strategy;

import cn.hutool.json.JSONUtil;
import com.yupi.noj.model.dto.question.JudgeCase;
import com.yupi.noj.model.dto.question.JudgeConfig;
import com.yupi.noj.judge.codesandbox.model.JudgeInfo;
import com.yupi.noj.model.entity.Question;
import com.yupi.noj.model.enums.JudgeInfoMessageEnum;

import java.util.List;
import java.util.Optional;

/**
 * Java判题策略
 */
public class JavaJudgeStrategy implements JudgeStrategy {
    @Override
    public JudgeInfo doJudge(JudgeContext context) {


        JudgeInfo judgeInfo = context.getJudgeInfo();

        // 代码沙箱编译错误
        if (judgeInfo == null || judgeInfo.getTime() == null){
            JudgeInfo judgeInfoResponse = new JudgeInfo();
            judgeInfoResponse.setMessage("编译错误");
            return judgeInfoResponse;
        }

        Long memory = Optional.ofNullable(judgeInfo.getMemory()).orElse(0L);
        Long time = Optional.ofNullable(judgeInfo.getTime()).orElse(0L);

        List<String> inputList = context.getInputList();
        List<String> outputList = context.getOutputList();
        Question question = context.getQuestion();
        List<JudgeCase> judgeCaseList = context.getJudgeCaseList();

        JudgeInfoMessageEnum judgeInfoMessageEnum = JudgeInfoMessageEnum.ACCEPTED;
        JudgeInfo judgeInfoResponse = new JudgeInfo();
        judgeInfoResponse.setMessage(judgeInfoMessageEnum.getValue());
        judgeInfoResponse.setMemory(memory);
        judgeInfoResponse.setTime(time);

        // 判断数量是否相等
        if (outputList.size() != inputList.size()){
            judgeInfoMessageEnum = JudgeInfoMessageEnum.WRONG_ANSWER;
            judgeInfoResponse.setMessage(judgeInfoMessageEnum.getValue());
            return judgeInfoResponse;
        }
        // 判断实际输出与预期输出是否相等
        for (int i = 0; i < outputList.size(); i++){
            JudgeCase judgeCase = judgeCaseList.get(i);
            if (!outputList.get(i).equals(judgeCase.getOutput())){
                judgeInfoMessageEnum = JudgeInfoMessageEnum.WRONG_ANSWER;
                judgeInfoResponse.setMessage(judgeInfoMessageEnum.getValue());
                return judgeInfoResponse;
            }
        }
        // 判断题目限制


        String judgeConfigStr = question.getJudgeConfig();
        JudgeConfig judgeConfig = JSONUtil.toBean(judgeConfigStr, JudgeConfig.class);

        Long memoryLimit = judgeConfig.getMemoryLimit();
        Long timeLimit = judgeConfig.getTimeLimit();

        if (memory > memoryLimit){
            judgeInfoMessageEnum = JudgeInfoMessageEnum.MEMORY_LIMIT_EXCEEDED;
            judgeInfoResponse.setMessage(judgeInfoMessageEnum.getValue());
            return judgeInfoResponse;
        }
        // Java程序执行时间需要额外执行时间
        long JAVA_PROGRAM_TIME_COST = 1000L;
        if ((time - JAVA_PROGRAM_TIME_COST) > timeLimit){
            judgeInfoMessageEnum = JudgeInfoMessageEnum.TIME_LIMIT_EXCEEDED;
            judgeInfoResponse.setMessage(judgeInfoMessageEnum.getValue());
            return judgeInfoResponse;
        }
        return judgeInfoResponse;
    }
}

package com.yupi.noj.judge;

import com.yupi.noj.judge.strategy.DefaultJudgeStrategy;
import com.yupi.noj.judge.strategy.JavaJudgeStrategy;
import com.yupi.noj.judge.strategy.JudgeContext;
import com.yupi.noj.judge.strategy.JudgeStrategy;
import com.yupi.noj.model.dto.questionsubmit.JudgeInfo;
import com.yupi.noj.model.entity.QuestionSubmit;
import org.springframework.stereotype.Service;

/**
 * 判题管理，简化调用
 */
@Service
public class JudgeManager {
    /**
     * 执行判题逻辑
     * @param context
     * @return
     */
    JudgeInfo doJudge(JudgeContext context){
        QuestionSubmit questionSubmit = context.getQuestionSubmit();
        String language = questionSubmit.getLanguage();
        JudgeStrategy judgeStrategy = new DefaultJudgeStrategy();
        if (language.equals("java")){
            judgeStrategy = new JavaJudgeStrategy();
        }
        return judgeStrategy.doJudge(context);
    }
}

package com.yupi.noj.judge.strategy;

import com.yupi.noj.judge.codesandbox.model.JudgeInfo;

/**
 * 判题策略接口
 */
public interface JudgeStrategy {
    /**
     * 执行判题逻辑
     * @param context
     * @return
     */
    JudgeInfo doJudge(JudgeContext context);
}

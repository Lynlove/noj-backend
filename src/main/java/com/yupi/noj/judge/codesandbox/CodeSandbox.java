package com.yupi.noj.judge.codesandbox;

import com.yupi.noj.judge.codesandbox.model.ExecuteCodeRequest;
import com.yupi.noj.judge.codesandbox.model.ExecuteCodeResponse;

public interface CodeSandbox {

    /**
     * 执行代码
     * @param executeCodeRequest
     * @return
     */
    ExecuteCodeResponse executeCode(ExecuteCodeRequest executeCodeRequest);

}

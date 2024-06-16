package com.yupi.noj.judge.codesandbox.impl;

import com.yupi.noj.judge.codesandbox.CodeSandbox;
import com.yupi.noj.judge.codesandbox.model.ExecuteCodeRequest;
import com.yupi.noj.judge.codesandbox.model.ExecuteCodeResponse;

/**
 * 第三方代码沙箱(调用网上现成的)
 */
public class ThirdPartyCodeSandbox implements CodeSandbox {
    @Override
    public ExecuteCodeResponse executeCode(ExecuteCodeRequest executeCodeRequest) {
        System.out.println("调用第三方代码沙箱");
        return null;
    }
}

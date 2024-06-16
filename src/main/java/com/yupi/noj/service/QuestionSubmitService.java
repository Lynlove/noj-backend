package com.yupi.noj.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yupi.noj.model.dto.questionsubmit.QuestionSubmitAddRequest;
import com.yupi.noj.model.dto.questionsubmit.QuestionSubmitQueryRequest;
import com.yupi.noj.model.entity.Question;
import com.yupi.noj.model.entity.QuestionSubmit;
import com.yupi.noj.model.entity.User;

import com.baomidou.mybatisplus.extension.service.IService;
import com.yupi.noj.model.vo.QuestionSubmitVO;
import com.yupi.noj.model.vo.QuestionVO;

import javax.servlet.http.HttpServletRequest;

/**
* @author lyn
* @description 针对表【question_submit(题目提交)】的数据库操作Service
* @createDate 2024-06-15 22:14:39
*/
public interface QuestionSubmitService extends IService<QuestionSubmit> {

    /**
     * 题目提交
     *
     * @param questionSubmitAddRequest 题目提交信息
     * @param loginUser
     * @return
     */
    long doQuestionSubmit(QuestionSubmitAddRequest questionSubmitAddRequest, User loginUser);

    /**
     * 获取查询条件
     *
     * @param questionSubmitQueryRequest
     * @return
     */
    QueryWrapper<QuestionSubmit> getQueryWrapper(QuestionSubmitQueryRequest questionSubmitQueryRequest);

    /**
     * 获取题目封装
     *
     * @param questionSubmit
     * @param request
     * @return
     */
    QuestionSubmitVO getQuestionSubmitVO(QuestionSubmit questionSubmit, HttpServletRequest request);

    /**
     * 分页获取题目封装
     *
     * @param questionSubmitPage
     * @param request
     * @return
     */
    Page<QuestionSubmitVO> getQuestionSubmitVOPage(Page<QuestionSubmit> questionSubmitPage, HttpServletRequest request);

    /**
     * 题目提交（内部服务）
     *
     * @param userId
     * @param questionId
     * @return
     */
    int doQuestionSubmitInner(long userId, long questionId);


}

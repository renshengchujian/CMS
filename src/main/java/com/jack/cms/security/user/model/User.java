package com.jack.cms.security.user.model;

import com.jack.common.bean.FwBean;

import lombok.Data;

/**
 * @author: Jack
 * @date: 2016/11/23
 */
@Data
public class User extends FwBean{

    /** 用户编号 * */
    private String userId;

    /** 真实姓名 * */
    private String userRelName;

    /** 用户状态 * */
    private String userStatus;

    /** 登录密码 * */
    private String userPassword;

    /** 备注 * */
    private String remark;

    /** 删除标志 * */
    private String deleteFlag;

    /** 邮箱 * */
    private String email;

    /** 手机号码 * */
    private String mobileNum;

}

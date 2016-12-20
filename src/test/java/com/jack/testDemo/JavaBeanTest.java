package com.jack.testDemo;

import com.jack.cms.security.user.model.User;

/**
 * @author : Jack
 * @Date : 2016/12/19
 */
public class JavaBeanTest {

    public static void main(String[] args) {
        User user = new User();
        user.setEmail("77");
        System.out.println(user.toString());
    }
}

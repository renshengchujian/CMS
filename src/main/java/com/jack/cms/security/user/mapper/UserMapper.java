package com.jack.cms.security.user.mapper;

import com.jack.cms.security.user.model.User;
import com.jack.common.mapper.MyMapper;

import java.util.List;

/**
 * @author: Jack
 * @date: 2016/11/23
 */
public interface UserMapper extends MyMapper<User> {
    List<User> findUserInfo();
}

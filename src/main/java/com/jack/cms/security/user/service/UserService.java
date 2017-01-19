package com.jack.cms.security.user.service;

import com.github.pagehelper.PageHelper;
import com.jack.cms.security.user.mapper.UserMapper;
import com.jack.cms.security.user.model.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author: Jack
 * @date: 2016/11/23
 */
@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

    public List<User> getAll(User user) {
        PageHelper.startPage(user.getPageNum(), user.getPageSize());
        return userMapper.selectAll();
    }

    public int getCount(User user) {
        return userMapper.selectCount(user);
    }


}

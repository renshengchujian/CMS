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
        user.setPageNum(1);
        user.setPageSize(10);

        user.setUserId("124");
        //user.setUserRelName("23");
        user.setEmail("15");
        int k = userMapper.updateByPrimaryKey(user);
        System.out.println(k);
        //System.out.println(user1.getEmail());
        //userMapper.insert(user);
        if (user.getPageNum() != null && user.getPageSize() != null) {
            PageHelper.startPage(user.getPageNum(), user.getPageSize());
        }
        return userMapper.selectAll();

    }


}

package com.jack.cms.security.user.control;

import com.jack.cms.security.user.model.User;
import com.jack.cms.security.user.service.UserService;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author: Jack
 * @date: 2016/11/23
 */
@Controller
public class UserController {

    private Logger logger = Logger.getLogger(UserController.class);

    @Autowired
    private UserService userService;

    @RequestMapping("/userSerInit")
    public String userSerInit(User user) {
        return "user/userSer";
    }

    @RequestMapping("/userSer")
    @ResponseBody
    public Map<String, Object> userSer(User user) {
        List<User> userList = userService.getAll(user);
        Map<String, Object> map = new HashMap<>();
        map.put("rows",userList);
        map.put("total",userService.getCount(user));
        return map;
    }

}




package com.jack.cms.security.user.control;

import com.jack.cms.security.user.model.User;
import com.jack.cms.security.user.service.UserService;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author: Jack
 * @date: 2016/11/23
 */
@Controller
public class UserController {

    private Logger logger = Logger.getLogger(UserController.class);

    @Autowired
    private UserService userService;

    @RequestMapping("/user")
    @ResponseBody
    public List<User> getUserInfo(User user) {
        List<User> userList = userService.getAll(user);
        return userList;
    }


    @RequestMapping("/doLogin")
    String user1(ModelMap modelMap) {
        return "layout/index";
    }

    @RequestMapping("/user2")
    String user2(ModelMap modelMap) {
        modelMap.put("name", "jack11");
        return "layout/login";
    }

    @RequestMapping("/userSer")
    String userSer(ModelMap modelMap) {
        modelMap.put("name", "jack11");
        return "user/userSer";
    }
}




package com.jack;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Controller
@EnableWebMvc
@SpringBootApplication
public class CmsApplication extends WebMvcConfigurerAdapter {

    public static void main(String[] args) {
        SpringApplication.run(CmsApplication.class, args);
    }

    @RequestMapping("/")
    String home(ModelMap modelMap) {
        modelMap.put("name", "jack11");
        return "layout/login";
    }

    @RequestMapping("/user1")
    String user1(ModelMap modelMap) {
        modelMap.put("name", "jack11");
        return "layout/login";
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

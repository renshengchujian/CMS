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

    @RequestMapping(value = {"/", "/login"})
    String login(ModelMap modelMap) {
        return "layout/login";
    }

    @RequestMapping(value = {"/doLogin"})
    String doLogin(ModelMap modelMap) {
        return "layout/index";
    }

}

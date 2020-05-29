package com.dyatlova.service.controllers;

import com.dyatlova.security.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainPage {

    @GetMapping("/")
    public String signUp(){
        return "/login";
    }

    @GetMapping("/login")
    public String mainPage(Model model){
       // model.addAttribute(userDao.findByUsername("username") );
        return "mainPage";
    }
}

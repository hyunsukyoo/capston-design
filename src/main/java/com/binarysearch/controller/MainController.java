package com.binarysearch.controller;

import com.binarysearch.domain.Users;
import com.binarysearch.dao.UsersServiceInterface;
import com.fasterxml.jackson.annotation.JsonProperty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class MainController {

    private final UsersServiceInterface usersServiceInterface;

    @Autowired
    public MainController(UsersServiceInterface usersServiceInterface) {
        this.usersServiceInterface = usersServiceInterface;
    }

    @GetMapping("/")
    public ModelAndView sayHi() {
        ModelAndView modelAndView = new ModelAndView("/index");
        return modelAndView;
    }

    @GetMapping("/join")
    public ModelAndView join() {
        ModelAndView modelAndView = new ModelAndView("createUser/create");
        return modelAndView;
    }

    @PostMapping("/join")
    public String join(@RequestBody Users users) {
        usersServiceInterface.saveUsers(users);
        System.out.println(users.getUserId() + " " + users.getUserAddress());
        return "hi";
    }


    @GetMapping("/login")
    public ModelAndView login() {
        ModelAndView modelAndView = new ModelAndView("loginUser/login");
        return modelAndView;
    }

    @PostMapping("/login")
    public String login(@JsonProperty("userId") String userId, @JsonProperty("userPw") String userPw) {
        Users userInfo = usersServiceInterface.checkUsers(userId);

        if(userInfo == null){
            return "로그인을 할 수 없습니다.";
        }else{
            if(userInfo.getUserPw().equals(userPw)){
                return "로그인";
            }else{
                return "비밀번호가 일치하지않는다.";
            }
        }
    }
}
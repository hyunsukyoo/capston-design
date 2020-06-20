package com.binarysearch.controller;

import com.binarysearch.domain.Users;
import com.binarysearch.dao.UsersServiceInterface;
import com.fasterxml.jackson.annotation.JsonProperty;
import org.apache.coyote.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;

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
    public ResponseEntity login(@RequestBody HashMap<String, String> loginInfo) {

        Users userInfo = usersServiceInterface.checkUsers(loginInfo.get("userId"));

        if(userInfo == null){
            return new ResponseEntity("로그인을 할 수 없습니다.", HttpStatus.CONFLICT);
        }else{
            if (userInfo.getUserPw().equals(loginInfo.get("userPw"))){
                return new ResponseEntity("로그인 성공", HttpStatus.OK);
            }
            else {
                return new ResponseEntity("비밀번호 불일치", HttpStatus.CONFLICT);
            }
        }
    }
}
package com.kimyena.memo.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/user")
@Controller
public class UserController {

    //회원가입 페이지
    @GetMapping("/signup/view")
    public String signupView() {

        return "user/signup";
    }

    //로그인 페이지
    @GetMapping("/signin/view")
    public String signinView(){
        return "user/signin";
    }
}

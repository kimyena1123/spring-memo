package com.kimyena.memo.user;

import com.kimyena.memo.user.bo.UserBO;
import com.kimyena.memo.user.model.User;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RequestMapping("/user")
@RestController //@Controller + @ResponseBody
public class UserRestController {

    @Autowired
    private UserBO userBO;

    //회원가입 API
    @PostMapping("/signup")
    public Map<String, Boolean> signup(
            @RequestParam("user_id") String user_id,
            @RequestParam("user_pw") String user_pw,
            @RequestParam("user_name") String user_name,
            @RequestParam("user_email") String user_email
    ){
        int count = userBO.insertUser(user_id, user_pw, user_name, user_email);

        Map<String, Boolean> result = new HashMap<>();

        if(count  == 1){ // insert 성공
            result.put("result", true);
        }else{ // insert 실패
            result.put("result", false);
        }

        return result;
    }

    //로그인 API
    @PostMapping("/signin")
    public Map<String, Boolean> signin(@RequestParam("user_id") String user_id,
                                       @RequestParam("user_pw") String user_pw,
                                       HttpServletRequest request){

        //user가 입력한 user_id와 user_pw 값 DB에 있으면 해당 행 정보 가져오기 => 그래서 User 객체로 가져옴
        User user = userBO.selectUser(user_id, user_pw);

        //세션 객체 받아오기
        HttpSession session = request.getSession();

        //세션에 특정한 값이 저장되어 있으면 로그인된 상태
        //세션에 특정한 값이 저장되어 있지 않으면 로그인이 되어 있지 않은 상태
        session.setAttribute("session_user_index", user.getId()); // PK값
        session.setAttribute("session_user_id", user.getUser_id()); //유저 아이디
        session.setAttribute("session_user_name", user.getUser_name()); //유저 이름

        Map<String, Boolean> result = new HashMap<>();

        //조회 안됐으면 null
        if(user != null) {
            result.put("result", true);
            //로그인 성공하면 session 생성.
            //index 값을 저장한 세션 생성
        }else {
            result.put("result", false);
        }

        return result;
    }
}

package com.kimyena.memo.user.bo;

import com.kimyena.memo.user.dao.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserBO {

    @Autowired
    private UserDAO userDAO;

    //회원가입
    public int insertUser(
            String user_id,
            String user_pw,
            String user_name,
            String user_email
    ){
        return userDAO.insertUser(user_id, user_pw, user_name, user_email);
    }
}

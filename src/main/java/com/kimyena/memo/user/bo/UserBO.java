package com.kimyena.memo.user.bo;

import com.kimyena.memo.common.EncryptUtils;
import com.kimyena.memo.user.dao.UserDAO;
import com.kimyena.memo.user.model.User;
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
        //비밀번호 암호화
        String encryptPassword = EncryptUtils.md5(user_pw);

        //넘겨줄 때 user_pw가 아닌 암호화된 encryptPassword로 넘겨준다.
        return userDAO.insertUser(user_id, encryptPassword, user_name, user_email);
    }

    //로그인
    public User selectUser(String user_id, String user_pw){
        //비밀번호 암호화
        String encryptPassword = EncryptUtils.md5(user_pw);

        return userDAO.selectUser(user_id, encryptPassword);
    }
}

package com.kimyena.memo.user.dao;

import com.kimyena.memo.user.model.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
@Mapper
@Repository
public interface UserDAO {

    //회원가입
    public int insertUser(
            @Param("user_id") String user_id,
            @Param("user_pw") String user_pw,
            @Param("user_name") String user_name,
            @Param("user_email") String user_email
    );

    //로그인 일치
    public User selectUser(
            @Param("user_id") String user_id,
            @Param("user_pw") String user_pw);
}
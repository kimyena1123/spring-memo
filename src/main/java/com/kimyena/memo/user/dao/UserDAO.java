package com.kimyena.memo.user.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
@Mapper
@Repository
public interface UserDAO {

    int insertUser(
            @Param("user_id") String user_id,
            @Param("user_pw") String user_pw,
            @Param("user_name") String user_name,
            @Param("user_email") String user_email
    );
}
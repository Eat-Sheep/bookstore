package com.dao.customer;

import com.entity.customer.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {
    User signin(@Param("userTel") String userTel, @Param("userPwd") String userPwd);

    List<User> query(@Param("pageNum") int pageNum, @Param("pageSize") int pageSize);

    void register(User user);
}

package com.service.customer;

import com.dao.customer.UserDao;
import com.entity.customer.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 *
 **/
@Service
public class UserService {
    @Autowired
    private UserDao dao;

    public User signin(String userTel, String userPwd) {
        return dao.signin(userTel, userPwd);
    }

    public List<User> query(int pageNum, int pageSize) {
        return dao.query(pageNum, pageSize);
    }

    public void register(User user) {
        dao.register(user);
    }
}

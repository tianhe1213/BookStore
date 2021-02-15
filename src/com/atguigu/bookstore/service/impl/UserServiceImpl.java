package com.atguigu.bookstore.service.impl;

import com.atguigu.bookstore.dao.UserDao;
import com.atguigu.bookstore.entities.User;
import com.atguigu.bookstore.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    public User login(User user) {
        return userDao.login(user);
    }

    @Override
    public User regist(String name) {
        return userDao.regist(name);
    }

    @Override
    public void save(User user) {

        userDao.save(user);

    }
}
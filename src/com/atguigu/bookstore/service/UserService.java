package com.atguigu.bookstore.service;

import com.atguigu.bookstore.entities.User;

public interface UserService {
//    处理用户登录的方法
    User login(User user);

    User regist(String name);

     void save(User user);
}

package com.atguigu.bookstore.dao;

import com.atguigu.bookstore.entities.User;
//根据User独享中的用户名和密码查询对应的记录
public interface UserDao {
    User login(User user);

    User regist(String name);

    void save(User user);
}

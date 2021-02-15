package com.atguigu.bookstore.dao.impl;

import com.atguigu.bookstore.dao.UserDao;
import com.atguigu.bookstore.entities.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl implements UserDao {
    @Autowired
   private JdbcTemplate jdbcTemplate;


    @Override
    public User login(User user) {

        String sql = "select id,username,password,email from users where username=? and password=?";
//        创建RowMapper
        BeanPropertyRowMapper<User> ro = new BeanPropertyRowMapper<>(User.class);
        User returnuser=null;
//        调用jdbc中的queryForObject

        try {
            returnuser = jdbcTemplate.queryForObject(sql, ro, user.getUsername(), user.getPassword());
        } catch (DataAccessException e) {
            System.out.println("没有查询结果");
        }

        return returnuser;
    }

    @Override
    public User regist(String name) {

        String sql="select id,username,`password`,email from users where username=?";

        BeanPropertyRowMapper<User> ro = new BeanPropertyRowMapper<>(User.class);

        User user1 = null;
        try{
            user1 = jdbcTemplate.queryForObject(sql, ro, name);
        }catch (Exception e){

        }
        return user1;

    }

    @Override
    public void save(User user) {
        String sql="INSERT INTO users(username,`password`,email) VALUES(?,?,?)";

        try {
            jdbcTemplate.update(sql, user.getUsername(),user.getPassword(),user.getEmail());
        } catch (DataAccessException e) {
            e.printStackTrace();
        }


    }


}

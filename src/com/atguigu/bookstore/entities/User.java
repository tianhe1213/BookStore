package com.atguigu.bookstore.entities;

/**
 * @Author Chunsheng Zhang
 * @Date 2020/12/8
 * @Time 9:14
 */
public class User {


    /**
     * 为什么需要三层
     *      1. 提供程序扩展性、减低维护成本
     *      2. 解耦
     *  三层
     *       生活     服务员     厨师           采购员
     *       程序     表示层     业务逻辑层     数据访问层[持久化层]
     *                servlet     service       dao
     */

    private Integer id;         //包装类型，优势：方便空值判断  ， 方便类型转换
    private String username;
    private String password;
    private String email;

    public User() {
    }

    public User(Integer id, String username, String password, String email) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}

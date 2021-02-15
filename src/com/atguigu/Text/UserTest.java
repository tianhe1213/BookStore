package com.atguigu.Text;


import com.atguigu.bookstore.dao.UserDao;
import com.atguigu.bookstore.dao.impl.UserDaoImpl;
import com.atguigu.bookstore.entities.User;
import com.atguigu.bookstore.service.UserService;
import com.atguigu.bookstore.service.impl.UserServiceImpl;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class UserTest {


            private UserDao userDao=new UserDaoImpl();
@Test
    public void ss() {
            User user=new User(null,"sujunjie","123456",null);
          User login = userDao.login(user);
          System.out.println("login = " + login);
}
}

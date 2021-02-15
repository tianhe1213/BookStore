package com.atguigu.bookstore.controller;

import com.atguigu.bookstore.entities.User;
import com.atguigu.bookstore.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

@Controller
public class UserContrller {

    @Autowired
    private UserService userService;
    @RequestMapping("/login")
    public String login(User user, Map<String ,Object> map, HttpSession session){
        User login = userService.login(user);
        if (login==null){
          //设置提示信息重新转发到login.jsp页面
            map.put("msg", "用户名或者密码不正确");
            return  "forward:/index.jsp";
        }else {
            session.setAttribute("user",login);
            return "redirect:/pages/user/login_success.jsp";
        }

    }

    @RequestMapping("/regist")
    public void regist(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("unValue");
                //将username放入service中
        User regist = userService.regist(username);


        if (regist==null){
            response.getWriter().write("true");
        }else {
            response.getWriter().write("false");
        }
    }

    @RequestMapping("/save")
    public String save(User user,HttpSession session){

        String username = user.getUsername();
        User regist = userService.regist(username);



         if(regist==null){
             userService.save(user);
             session.setAttribute("user",user);

             return "redirect:/pages/user/login_success.jsp";
        }else {
             return  "forward:/index.jsp";

         }


    }

}

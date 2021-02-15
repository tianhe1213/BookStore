package com.atguigu.bookstore.controller;

import com.atguigu.bookstore.entities.Book;
import com.atguigu.bookstore.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class managerController {
    @Autowired
    private ManagerService managerService;

    @RequestMapping("/Backstagemanagement")
    public ModelAndView getAllBooks( HttpServletRequest request){
        List allBooks = managerService.getAllBooks();

        Map<String,Object> map = new HashMap<>();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("list",allBooks);
        modelAndView.setViewName("manager/book_manager");
        map.put("list", allBooks);
//        request.setAttribute("page", allBooks);
     return modelAndView;
    }


    @RequestMapping("/saveOrUpdateBook")
    public  String modifybooks(HttpServletRequest request, Book book){
        Integer id = book.getId();
        if(id==null||"".equals(id)){
            //添加图书
            managerService.insertBooks(book);
            return "redirect:/Backstagemanagement";
        }else {
            //修改图书
            managerService.updateBook(book);
            request.setAttribute("book", book);
            return  "redirect:/Backstagemanagement";
        }

    }

    @RequestMapping("/checkBooksById/{id}")
    public  String checkBooksById(@PathVariable(value = "id",required = false) Integer id,HttpServletRequest request){

        Book book = managerService.checkBookById(id);
        request.setAttribute("book", book);

        return "forward:/pages/manager/book_edit.jsp";
    }
}

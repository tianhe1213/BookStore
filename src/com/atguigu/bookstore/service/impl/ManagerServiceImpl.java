package com.atguigu.bookstore.service.impl;

import com.atguigu.bookstore.dao.ManagerDao;
import com.atguigu.bookstore.entities.Book;
import com.atguigu.bookstore.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ManagerServiceImpl implements ManagerService {
    @Autowired
    private ManagerDao managerDao;
    @Override
    public List getAllBooks() {

        return managerDao.getAllBooks();
    }

    @Override
    public void insertBooks(Book book) {

        managerDao.insertBooks(book);
    }

    @Override
    public void updateBook(Book book) {

        managerDao.updateBook(book);
    }

    @Override
    public Book checkBookById(Integer id) {

        return managerDao.checkBookById(id);
    }
}

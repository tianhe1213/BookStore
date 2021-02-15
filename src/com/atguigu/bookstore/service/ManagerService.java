package com.atguigu.bookstore.service;

import com.atguigu.bookstore.entities.Book;

import java.util.List;

public interface ManagerService {
    List getAllBooks();

    void insertBooks(Book book);

    void updateBook(Book book);

    Book checkBookById(Integer id);
}

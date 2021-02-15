package com.atguigu.bookstore.dao;

import com.atguigu.bookstore.entities.Book;

import java.util.List;

public interface ManagerDao {
    List getAllBooks();

    void insertBooks(Book book);

    void updateBook(Book book);

    Book checkBookById(Integer id);
}

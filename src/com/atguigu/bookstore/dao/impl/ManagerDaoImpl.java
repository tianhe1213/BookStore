package com.atguigu.bookstore.dao.impl;

import com.atguigu.bookstore.dao.ManagerDao;
import com.atguigu.bookstore.entities.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ManagerDaoImpl implements ManagerDao {
@Autowired
    JdbcTemplate jdbcTemplate;

    @Override
    public List getAllBooks() {
        String sql="SELECT id,title,author,price,sales,stock,img_path FROM books;";

        BeanPropertyRowMapper<Book> ro = new BeanPropertyRowMapper<>(Book.class);
        List<Book> list = jdbcTemplate.query(sql, ro);
        return list;
    }

    @Override
    public void insertBooks(Book book) {
        String sql="INSERT INTO books(title,author,price,sales,stock,img_path) VALUES(?,?,?,?,?,?)";

        jdbcTemplate.update(sql,book.getTitle(),book.getAuthor(),book.getPrice(),book.getSales(),book.getStock(),book.getImg_path());
    }

    @Override
    public void updateBook(Book book) {
        String sql="UPDATE books SET title=?,author=?,price=?,stock=? WHERE id=?";
        jdbcTemplate.update(sql, book.getTitle(),book.getAuthor(),book.getPrice(),book.getStock(),book.getId());

    }

    @Override
    public Book checkBookById(Integer id) {

        String sql="SELECT id,title,author,price,sales,stock,img_path FROM books WHERE id=?";
        BeanPropertyRowMapper<Book> ro = new BeanPropertyRowMapper<>(Book.class);
        Book book = jdbcTemplate.queryForObject(sql, ro, id);
        return book;
    }

}

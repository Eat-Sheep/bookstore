package com.service.bookinfo;

import com.dao.bookinfo.BookInfoDao;
import com.entity.bookinfo.BookInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookInfoService {
    @Autowired
    private BookInfoDao dao;

    public List<BookInfo> getAll(int pageNum, int pageSize) {
        return dao.getAll(pageNum, pageSize);
    }

    public void insert(BookInfo bookInfo) {
        dao.insert(bookInfo);
    }

    public void delete(int bookId) {
        dao.delete(bookId);
    }

    public BookInfo getId(int bookId) {
        return dao.getId(bookId);
    }

    public void update(BookInfo bookInfo) {
        dao.update(bookInfo);
    }

    public List<BookInfo> vague(String name) {
        return dao.vague(name);
    }
}

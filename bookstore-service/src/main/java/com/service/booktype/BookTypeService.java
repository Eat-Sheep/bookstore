package com.service.booktype;

import com.dao.bookType.BookTypeDao;
import com.entity.bookType.BookType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookTypeService {
    @Autowired
    private BookTypeDao dao;

    public List<BookType> type() {
        return dao.type();
    }
}

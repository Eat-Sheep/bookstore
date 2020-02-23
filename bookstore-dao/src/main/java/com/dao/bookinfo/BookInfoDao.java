package com.dao.bookinfo;

import com.entity.bookinfo.BookInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookInfoDao {
    List<BookInfo> getAll(@Param("pageNum") int pageNum, @Param("pageSize") int pageSize);

    void insert(BookInfo bookInfo);

    void delete(int bookId);

    BookInfo getId(int bookId);

    void update(BookInfo bookInfo);

    List<BookInfo> vague(String name);
}

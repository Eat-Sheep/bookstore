package com.entity.bookinfo;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class BookInfo {
    private Integer bookId;
    private String bookTypeId;
    private String bookName;
    private String bookPress;
    private String bookAuthor;
    private double bookPrice;
    private Integer bookStoremount;
    private String bookImg;
}

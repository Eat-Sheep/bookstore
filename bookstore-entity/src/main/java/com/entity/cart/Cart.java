package com.entity.cart;


import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class Cart {
    private Integer customerId;
    private String cartName;
    private float price;
    private Integer ordermount;
    private String tel;
}

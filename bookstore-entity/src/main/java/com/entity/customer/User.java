package com.entity.customer;

import lombok.Data;
import lombok.ToString;

import java.util.Date;

@ToString
@Data
public class User {
    private int userId;
    private String userName;
    private String userTel;
    private String userPwd;
    private String userSex;
    private String userAddr;
    private Date userTime;
}

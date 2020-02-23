package com.controller;

import com.entity.bookType.BookType;
import com.service.booktype.BookTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class BookTypeController {

    @Autowired
    private BookTypeService service;

    @RequestMapping("/type")
    public String list(Model model) {
        List<BookType> users = service.type();
        model.addAttribute("type", users);
        return "bookinfo/fengLie";
    }
}

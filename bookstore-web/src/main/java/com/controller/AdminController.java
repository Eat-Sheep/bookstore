package com.controller;

import com.entity.bookinfo.BookInfo;
import com.github.pagehelper.PageInfo;
import com.service.bookinfo.BookInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 *
 */
@Controller
public class AdminController {
    @Autowired
    private BookInfoService service;

    @RequestMapping("/admin")
    public String admin() {
        return "/admin/admin";
    }

    //书籍信息查询

    @RequestMapping("/info")
    public String info(@RequestParam(value = "pageNum",
            required = false, defaultValue = "1") int pageNum,
                       @RequestParam(value = "pageSize",
                               required = false, defaultValue = "8") int pageSize, Model model) {
        List<BookInfo> bookInfos = service.getAll(pageNum, pageSize);
        PageInfo pageInfo = new PageInfo(bookInfos);
        model.addAttribute("list", pageInfo);
        return "/admin/bookInformation";
    }
}

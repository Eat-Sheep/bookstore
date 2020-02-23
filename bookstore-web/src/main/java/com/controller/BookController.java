package com.controller;

import com.entity.bookinfo.BookInfo;
import com.github.pagehelper.PageInfo;
import com.service.bookinfo.BookInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.InputStreamSource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.List;


@Controller
public class BookController {
    public static final String FILE_DIRECTORY = "/E:/Pic";

    @Autowired
    private BookInfoService bookInfoService;

    //主页面分页

    @RequestMapping("/list")
    public String list(@RequestParam(value = "pageNum",
            required = false, defaultValue = "1") int pageNum,
                       @RequestParam(value = "pageSize",
                               required = false, defaultValue = "30") int pageSize, Model model) {
        List<BookInfo> bookInfos = bookInfoService
                .getAll(pageNum, pageSize);

        PageInfo pageInfo = new PageInfo(bookInfos);
        model.addAttribute("list", pageInfo);
        return "/bookinfo/list";
    }

    @RequestMapping("/vague")
    public String vague(String name, Model model) {
        List<BookInfo> vague = bookInfoService.vague(name);
        model.addAttribute("vague", vague);
        return "/bookinfo/detailed";
    }

    //添加图书

    @GetMapping("/add")
    public String add() {
        return "/bookinfo/add";
    }

    @PostMapping("/bookinsert")
    public String insert(@Valid BookInfo bookInfo, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "/bookinfo/add";
        } else {
            bookInfoService.insert(bookInfo);
            return "redirect:/admin";
        }
    }


    //删除

    @RequestMapping("/deletebook")
    public String deleteBook(int id) {
        bookInfoService.delete(id);
        return "/admin/admin";
    }

    //查
    @RequestMapping("/check")
    public String check(Integer bookId, Model model) {
        BookInfo bookInfo1 = bookInfoService.getId(bookId);
        model.addAttribute("bookInfo1", bookInfo1);
        return "/bookinfo/modify";
    }

    //修改

    @RequestMapping("/edit")
    public String updUserById(BookInfo bookInfo) {
        bookInfoService.update(bookInfo);
        return "redirect:/admin";
    }


    @RequestMapping("/information")
    public ModelAndView information(String bookId, HttpSession session) {
        int bookIdd = Integer.parseInt(bookId);
        String phon= String.valueOf(session.getAttribute("tel"));
        BookInfo bookInfo = bookInfoService.getId(bookIdd);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("bookInfo", bookInfo);
        modelAndView.addObject("tel",phon);

        modelAndView.setViewName("/bookinfo/bookInformation");
        return modelAndView;
    }


    //文件上传

    @PostMapping("/upload")
    public String upload(MultipartFile myfile) {

        //得到上传过来的文件名,一般要改名,比如用UUID
        String filename = myfile.getOriginalFilename();
        String path = FILE_DIRECTORY + File.separator + filename;
        File file = new File(path);
        try {
            myfile.transferTo(file);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "/list";
    }


    //文件下载

    @RequestMapping("/download")
    public ResponseEntity<InputStreamSource> download(String filename) throws IOException {
        //在mac系统下pathSeparator值为: ,separator值为: /
        String fullPath = FILE_DIRECTORY + File.separator + filename;

        File file = new File(fullPath);
        //这个guess方法是依据文件名来得到媒体类型也就是mime类型,
        // 比如常见有image/jpeg,application/json
        String mediaType = URLConnection.guessContentTypeFromName(filename);
        if (mediaType == null) {
            /*识别不了时,统统用这个,一般用来表示下载二进制数据*/
            mediaType = MediaType.APPLICATION_OCTET_STREAM_VALUE;
        }
        System.out.println("-----debug: mediaType = " + mediaType);
        HttpHeaders respHeaders = new HttpHeaders();
        respHeaders.setContentType(MediaType.parseMediaType(mediaType));

        //attachment :附件的意思,表示告诉浏览器弹出一个另存为窗口来下载文件,
        // inline是直接在浏览器中打开下载的文件
        //需要进行URL编码处理,否则另存为对话框不能显示中文
        respHeaders.setContentDispositionFormData("attachment",
                URLEncoder.encode(filename, "UTF-8"));


        InputStreamResource isr =
                new InputStreamResource(new FileInputStream(file));
        return new ResponseEntity<>(isr, respHeaders, HttpStatus.OK);
    }
}

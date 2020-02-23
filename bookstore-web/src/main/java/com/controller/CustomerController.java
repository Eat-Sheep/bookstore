package com.controller;

import com.aliyuncs.CommonRequest;
import com.aliyuncs.CommonResponse;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.exceptions.ServerException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;
import com.entity.customer.User;
import com.github.pagehelper.PageInfo;
import com.service.customer.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
public class CustomerController {
    @Autowired
    private UserService service;

    //用户登录

    @RequestMapping("/login")
    public ModelAndView login(String userTel, String userPwd, HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        User user = service.signin(userTel, userPwd);
        System.out.println("customer = " + user);
        if (user != null) {
            session.setAttribute("tel",user.getUserTel());
            session.setAttribute("username", user.getUserName());
            modelAndView.setViewName("redirect:list");
            modelAndView.addObject("name", userTel);
        } else {
            modelAndView.setViewName("redirect:/enterlogin");
            modelAndView.addObject("error", "账号/密码错，请检查：");
        }
        return modelAndView;
    }


    @RequestMapping("/resit")
    public String resit(HttpServletRequest request) {
        request.removeAttribute("username");
        return "redirect:/enterlogin";
    }

    @RequestMapping("/enterlogin")
    public String loginUI() {
        return "/customer/login";
    }

    //查询用户

    @RequestMapping("/query")
    public String query(@RequestParam(value = "pageNum",
            required = false, defaultValue = "1") int pageNum,
                        @RequestParam(value = "pageSize",
                                required = false, defaultValue = "10") int pageSize, Model model) {
        List<User> users = service
                .query(pageNum, pageSize);
        PageInfo pageInfo = new PageInfo(users);
        model.addAttribute("query", pageInfo);
        return "/admin/bookUser";
    }


    //用户注册

    @GetMapping("/register")
    public String register() {
        return "/customer/register";
    }

    @PostMapping("/customerinsert")
    public String insert(@Valid User user, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "/customer/register";
        } else {
            service.register(user);
            return "redirect:/login";
        }
    }

    //发送验证码

    @RequestMapping("/verifications")
    public void verifications(String userTel, HttpSession session) {
        int ran = 0;
        String rao = "";
        for (int i = 0; i < 5; i++) {
            ran = (int) (Math.random() * 9);
            rao += ran;
        }
        // 密匙  密码
        DefaultProfile profile = DefaultProfile.getProfile("cn-hangzhou", "LTAI4FuX6EUMG64sSciczSuG", "5THQrtrbitUgBQTPHLacku3GlIDP8o");
        IAcsClient client = new DefaultAcsClient(profile);
        CommonRequest request = new CommonRequest();
        request.setMethod(MethodType.POST);
        request.setDomain("dysmsapi.aliyuncs.com");
        request.setVersion("2017-05-25");
        request.setAction("SendSms");
        request.putQueryParameter("RegionId", "cn-hangzhou");
        // values为手机号码
        request.putQueryParameter("PhoneNumbers", userTel);
        // values为短信签名
        request.putQueryParameter("SignName", "吃羊验证");
        // values为模板
        request.putQueryParameter("TemplateCode", "SMS_180051514");
        // values 发送的验证码
        request.putQueryParameter("TemplateParam", "{\"code\":"+rao+"}");
        session.setAttribute("code", rao);
        try {
            CommonResponse response = client.getCommonResponse(request);
            System.out.println(response.getData());
        } catch (ServerException e) {
            e.printStackTrace();
        } catch (ClientException e) {
            e.printStackTrace();
        }
    }

    //判断验证码是否正确

    @PostMapping("/code")
    public String code(String code, HttpServletRequest request) {
        String code1 = (String) request.getSession().getAttribute("code");
        if (code.equals(code1)) {

        }
        return "/bookinfo/list";
    }

}


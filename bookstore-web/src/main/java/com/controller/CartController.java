package com.controller;

import com.entity.cart.Cart;
import com.service.cart.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
public class CartController {
    @Autowired
    private CartService service;


    @PostMapping("/order")
    public String order(Cart cart, HttpSession session) {
        String phon = String.valueOf(session.getAttribute("tel"));
        cart.setTel(phon);
        service.order(cart);
        System.out.println(cart);
        session.setAttribute("carts", cart);
        return "/shopping/orders";
    }


    @RequestMapping("/tel")
    public String tel(HttpServletRequest request, Model model) {
        String phone = (String) request.getSession().getAttribute("tel");
        List<Cart> cart = service.tel(phone);
        model.addAttribute("cart", cart);
        return "/shopping/shopping";
    }
}

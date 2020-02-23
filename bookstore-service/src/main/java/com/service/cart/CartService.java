package com.service.cart;

import com.entity.cart.Cart;
import com.dao.cart.CartDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartService {
    @Autowired
    private CartDao dao;

    public void order(Cart cart) {
        dao.order(cart);
    }

    public List<Cart> tel(String tel) {
        return dao.tel(tel);
    }
}

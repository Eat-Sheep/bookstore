package com.dao.cart;


import com.entity.cart.Cart;

import java.util.List;

public interface CartDao {
    void order(Cart cart);

    List<Cart> tel(String tel);
}

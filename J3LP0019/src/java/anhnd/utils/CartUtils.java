/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhnd.utils;

import anhnd.dtos.CartModel;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author anhnd
 */
public class CartUtils {

    public static List<CartModel> getAllCart(HashMap<String, CartModel> map) {
        List<CartModel> values = new ArrayList<CartModel>();
        for (CartModel item : map.values()) {
            values.add(item);
        }

        return values;

    }
    
    public static float caculateTotalPrice(HashMap<String, CartModel> map) {
        float totalPrice = 0;
        for (CartModel item : map.values()) {
            totalPrice = totalPrice + item.getPrice();
        }

        return totalPrice;

    }
    
    
}


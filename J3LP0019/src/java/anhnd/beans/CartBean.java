/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhnd.beans;

import anhnd.dtos.CartModel;
import java.util.HashMap;

/**
 *
 * @author anhnd
 */
public class CartBean extends HashMap<String, CartModel> {

    public CartBean() {
        super();
    }

    public void addCake(CartModel cartModel) {
        String key = cartModel.getCakeId();
        if (this.containsKey(key)) {
            int oldQuantity = ((CartModel) this.get(key)).getQuantity();
            float oldPrice = ((CartModel) this.get(key)).getPrice();
            ((CartModel) this.get(key)).setQuantity(oldQuantity + 1);
            ((CartModel) this.get(key)).setPrice(oldPrice + cartModel.getPrice());
        } else {
            this.put(cartModel.getCakeId(), cartModel);
        }
    }

    public boolean removeCake(String id) {
        if (this.containsKey(id)) {
            this.remove(id);
            return true;
        }
        return false;
    }

    public boolean updateCake(String id, int newQuantity) {
        if (this.containsKey(id)) {
             float price = ((CartModel) this.get(id)).getPricePerCake();
            ((CartModel) this.get(id)).setQuantity(newQuantity);
            ((CartModel) this.get(id)).setPrice(price * newQuantity);
            return true;
        }
        return false;
    }
    
}

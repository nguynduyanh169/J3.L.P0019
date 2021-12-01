/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhnd.dtos;

import java.io.Serializable;

/**
 *
 * @author anhnd
 */
public class CartModel implements Serializable{
    private String cakeId;
    private String cakeName;
    private float price;
    private float pricePerCake;
    private int quantity; 
    private int currentQuantity;

    public String getCakeId() {
        return cakeId;
    }

    public void setCakeId(String cakeId) {
        this.cakeId = cakeId;
    }

    public String getCakeName() {
        return cakeName;
    }

    public void setCakeName(String cakeName) {
        this.cakeName = cakeName;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public CartModel(String cakeId, String cakeName, float price, float pricePerCake, int currentQuantity) {
        this.cakeId = cakeId;
        this.cakeName = cakeName;
        this.price = price;
        this.pricePerCake = pricePerCake;
        this.quantity = 1;
        this.currentQuantity = currentQuantity;
    }

    public float getPricePerCake() {
        return pricePerCake;
    }

    public void setPricePerCake(float pricePerCake) {
        this.pricePerCake = pricePerCake;
    }

    public int getCurrentQuantity() {
        return currentQuantity;
    }

    public void setCurrentQuantity(int currentQuantity) {
        this.currentQuantity = currentQuantity;
    }

    
    
}


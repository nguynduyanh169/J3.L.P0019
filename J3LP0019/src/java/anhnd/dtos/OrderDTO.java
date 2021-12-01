/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhnd.dtos;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author anhnd
 */
public class OrderDTO implements Serializable{
    private String orderId;
    private String orderBy;
    private String shipAddress;
    private String phone;
    private int status;
    private Date orderDate;

    public OrderDTO(String orderId, String orderBy, String shipAddress, String phone, int status, Date orderDate) {
        this.orderId = orderId;
        this.orderBy = orderBy;
        this.shipAddress = shipAddress;
        this.phone = phone;
        this.status = status;
        this.orderDate = orderDate;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getOrderBy() {
        return orderBy;
    }

    public void setOrderBy(String orderBy) {
        this.orderBy = orderBy;
    }

    public String getShipAddress() {
        return shipAddress;
    }

    public void setShipAddress(String shipAddress) {
        this.shipAddress = shipAddress;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    @Override
    public String toString() {
        return "OrderDTO{" + "orderId=" + orderId + ", orderBy=" + orderBy + ", shipAddress=" + shipAddress + ", phone=" + phone + ", status=" + status + ", orderDate=" + orderDate + '}';
    }
    
    
    
    
}

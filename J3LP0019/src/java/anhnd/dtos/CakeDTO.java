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
public class CakeDTO implements Serializable{
    private String cakeId;
    private String cakeName;
    private String imgPath;
    private String categoryId;
    private int quantity;
    private String description;
    private float price;
    private Date createDate;
    private Date expirationDate;
    private int status;
    private String createBy;

    public CakeDTO(String cakeId, String cakeName, String imgPath, String categoryId, int quantity, String description, float price, Date createDate, Date expirationDate, int status, String createBy) {
        this.cakeId = cakeId;
        this.cakeName = cakeName;
        this.imgPath = imgPath;
        this.categoryId = categoryId;
        this.quantity = quantity;
        this.description = description;
        this.price = price;
        this.createDate = createDate;
        this.expirationDate = expirationDate;
        this.status = status;
        this.createBy = createBy;
    }

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

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getExpirationDate() {
        return expirationDate;
    }

    public void setExpirationDate(Date expirationDate) {
        this.expirationDate = expirationDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }
    
    
}

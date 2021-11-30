/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhnd.dtos;

import java.sql.Date;

/**
 *
 * @author anhnd
 */
public class UpdateRecordDTO {
    private String updateId;
    private String email;
    private String cakeId;
    private Date updateDate;

    public UpdateRecordDTO(String updateId, String email, String cakeId, Date updateDate) {
        this.updateId = updateId;
        this.email = email;
        this.cakeId = cakeId;
        this.updateDate = updateDate;
    }

    public String getUpdateId() {
        return updateId;
    }

    public void setUpdateId(String updateId) {
        this.updateId = updateId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCakeId() {
        return cakeId;
    }

    public void setCakeId(String cakeId) {
        this.cakeId = cakeId;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }
    
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhnd.dtos;

/**
 *
 * @author anhnd
 */
public class CakeErrorObj {

    private String emptyCakeName;
    private String quantityLowerThanZero;
    private String priceLowerThanZero;
    private String priceEmpty;
    private String quantityEmpty;
    private String emptyDescription;
    private String expirationDateErr;
    private String expirationDateEmpty;

    public String getEmptyCakeName() {
        return emptyCakeName;
    }

    public String getPriceEmpty() {
        return priceEmpty;
    }

    public void setPriceEmpty(String priceEmpty) {
        this.priceEmpty = priceEmpty;
    }

    public String getQuantityEmpty() {
        return quantityEmpty;
    }

    public void setQuantityEmpty(String quantityEmpty) {
        this.quantityEmpty = quantityEmpty;
    }

    public void setEmptyCakeName(String emptyCakeName) {
        this.emptyCakeName = emptyCakeName;
    }

    public String getQuantityLowerThanZero() {
        return quantityLowerThanZero;
    }

    public void setQuantityLowerThanZero(String quantityLowerThanZero) {
        this.quantityLowerThanZero = quantityLowerThanZero;
    }

    public String getEmptyDescription() {
        return emptyDescription;
    }

    public void setEmptyDescription(String emptyDescription) {
        this.emptyDescription = emptyDescription;
    }

    public String getPriceLowerThanZero() {
        return priceLowerThanZero;
    }

    public void setPriceLowerThanZero(String priceLowerThanZero) {
        this.priceLowerThanZero = priceLowerThanZero;
    }

    public String getExpirationDateErr() {
        return expirationDateErr;
    }

    public void setExpirationDateErr(String expirationDateErr) {
        this.expirationDateErr = expirationDateErr;
    }

    public String getExpirationDateEmpty() {
        return expirationDateEmpty;
    }

    public void setExpirationDateEmpty(String expirationDateEmpty) {
        this.expirationDateEmpty = expirationDateEmpty;
    }
}

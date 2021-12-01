/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhnd.daos;

import anhnd.dtos.OrderDTO;
import anhnd.dtos.OrderDetailDTO;
import anhnd.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author anhnd
 */
public class OrderDetailDAO {

    public OrderDetailDAO() {
    }
    
    public boolean insertOrderDetails(OrderDetailDTO orderDetailDTO) throws SQLException, NamingException{
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        boolean check = false;
        try {
            connection = DBUtils.makeConnection();
            String sql = "Insert into OrderDetail (orderDetailId, orderId, cakeId, cakeName, quantity, price)"
                    + " values(?, ?, ?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, orderDetailDTO.getOrderDetailsId());
            preparedStatement.setString(2, orderDetailDTO.getOrderId());
            preparedStatement.setString(3, orderDetailDTO.getCakeId());
            preparedStatement.setString(4, orderDetailDTO.getCakeName());
            preparedStatement.setInt(5, orderDetailDTO.getQuantity());
            preparedStatement.setFloat(6, orderDetailDTO.getPrice());
            int row = preparedStatement.executeUpdate();
            if(row > 0 ){
                check = true;
            }
        } finally {

            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
        return check;
    }
    
    public List<OrderDetailDTO> getDetailsOfOrder(String orderId) throws SQLException, NamingException{
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        OrderDetailDTO orderDetailDTO = null;
        List<OrderDetailDTO> result = null;
        try {
            connection = DBUtils.makeConnection();
            String sql = "Select orderDetailId, cakeId, cakeName, quantity, price from OrderDetail where orderId = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, orderId);
            resultSet = preparedStatement.executeQuery();
            result = new ArrayList<>();
            while (resultSet.next()) {                
                String orderDetailId = resultSet.getString("orderDetailId");
                String cakeId = resultSet.getString("cakeId");
                String cakeName = resultSet.getString("cakeName");
                int quantity = resultSet.getInt("quantity");
                float price = resultSet.getFloat("price");
                orderDetailDTO = new OrderDetailDTO(orderDetailId, orderId, cakeId, cakeName, quantity, price);
                result.add(orderDetailDTO);
            }
        } finally {
            if (resultSet != null) {
                resultSet.close();
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
        return result;
    }
}

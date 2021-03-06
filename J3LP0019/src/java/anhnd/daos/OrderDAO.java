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
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author anhnd
 */
public class OrderDAO {

    public OrderDAO() {
    }
    
    
    public boolean insertOrder(OrderDTO orderDTO) throws SQLException, NamingException{
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        boolean check = false;
        try {
            connection = DBUtils.makeConnection();
            String sql = "Insert into OrderCake (orderId, orderBy, shipAddress, phone, status, orderDate)"
                    + " values(?, ?, ?, ?, ?, CAST( GETDATE() AS date))";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, orderDTO.getOrderId());
            preparedStatement.setString(2, orderDTO.getOrderBy());
            preparedStatement.setString(3, orderDTO.getShipAddress());
            preparedStatement.setString(4, orderDTO.getPhone());
            preparedStatement.setInt(5, orderDTO.getStatus());
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
    
    public OrderDTO getOrderById(String orderId) throws SQLException, NamingException{
         Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        OrderDTO orderDTO = null;
        try{
            connection = DBUtils.makeConnection();
            String sql = "Select orderBy, shipAddress, phone, status, orderDate from OrderCake where orderId = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, orderId);
            resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                String orderBy = resultSet.getString("orderBy");
                String shipAddress = resultSet.getString("shipAddress");
                String phone = resultSet.getString("phone");
                int status = resultSet.getInt("status");
                Date orderDate = resultSet.getDate("orderDate");
                orderDTO = new OrderDTO(orderId, orderBy, shipAddress, phone, status, orderDate);
            }
        }finally {
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
        return orderDTO;
    }
}

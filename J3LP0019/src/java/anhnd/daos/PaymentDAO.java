/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhnd.daos;

import anhnd.dtos.OrderDTO;
import anhnd.dtos.PaymentDTO;
import anhnd.utils.DBUtils;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;

/**
 *
 * @author anhnd
 */
public class PaymentDAO {

    public PaymentDAO() {
    }
    
    public boolean insertPayment(PaymentDTO paymentDTO) throws NamingException, SQLException{
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        boolean check = false;
        try {
            connection = DBUtils.makeConnection();
            String sql = "Insert into Payment (paymentId, orderId, status, method)"
                    + " values(?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, paymentDTO.getPaymentId());
            preparedStatement.setString(2, paymentDTO.getOrderId());
            preparedStatement.setInt(3, paymentDTO.getStatus());
            preparedStatement.setString(4, paymentDTO.getMethod());
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
    
    public PaymentDTO getPaymentByOrderId(String orderId) throws NamingException, SQLException{
         Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        PaymentDTO paymentDTO = null;
        try{
            connection = DBUtils.makeConnection();
            String sql = "Select paymentId, status, method from Payment where orderId = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, orderId);
            resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                String paymentId = resultSet.getString("paymentId");
                int status = resultSet.getInt("status");
                String method = resultSet.getString("method");
                paymentDTO = new PaymentDTO(paymentId, orderId, status, method);
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
        return paymentDTO;
    }
}

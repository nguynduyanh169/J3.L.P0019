/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhnd.daos;

import anhnd.dtos.AccountDTO;
import anhnd.utils.DBUtils;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;

/**
 *
 * @author anhnd
 */
public class AccountDAO {

    public AccountDAO() {

    }

    public AccountDTO checkLogin(String email, String password) throws SQLException, NamingException {
        AccountDTO accountDTO = null;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            connection = DBUtils.makeConnection();
            if(connection != null){
                connection = DBUtils.makeConnection();
            if(connection != null) {
                String sql = "Select email, fullname, phone, roleId, status from Account where email=? and password=?";
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, email);
                preparedStatement.setString(2, password);
                resultSet = preparedStatement.executeQuery();
                if(resultSet.next()) {
                    String fullName = resultSet.getString("fullname");
                    String phone = resultSet.getString("phone");
                    int role = resultSet.getInt("roleId");
                    int status = resultSet.getInt("status");
                    accountDTO = new AccountDTO(email, fullName, phone, role, status);
                }
            }
            }
        } finally {
            if (resultSet != null) {
                preparedStatement.close();
            }
            if (preparedStatement != null) {
                connection.close();
            }
            if (connection != null) {
                resultSet.close();
            }
        }
        return accountDTO;
    }
    
    public AccountDTO checkLoginWithGoogle(String email) throws NamingException, SQLException, NoSuchAlgorithmException {
        AccountDTO dto = null;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            connection = DBUtils.makeConnection();
            if(connection != null) {
                String sql = "Select email, fullname, phone, roleId, status from Account where email=?";
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, email);
                resultSet = preparedStatement.executeQuery();
                if(resultSet.next()) {
                    String fullName = resultSet.getString("fullname");
                    String phone = resultSet.getString("phone");
                    int role = resultSet.getInt("roleId");
                    int status = resultSet.getInt("status");
                    dto = new AccountDTO(email, fullName, phone, role, status);
                }
            }
        } finally {
            if (resultSet != null) {
                preparedStatement.close();
            }
            if (preparedStatement != null) {
                connection.close();
            }
            if(connection != null){
                resultSet.close();
            }
        }
        return dto;
    } 
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhnd.daos;

import anhnd.dtos.CakeDTO;
import anhnd.utils.DBUtils;
import java.sql.Connection;
import java.sql.Date;
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
public class CakeDAO {

    public CakeDAO() {
    }

    public List<CakeDTO> getCakeByLikeName(String name, int pageIndex, int pageSize, String selectCategoryId, float fromPrice, float toPrice) throws SQLException, NamingException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        CakeDTO dto = null;
        List<CakeDTO> result = null;
        try {
            connection = DBUtils.makeConnection();
            if (connection != null) {
                if (selectCategoryId == null && fromPrice == 0 && toPrice == 0) {
                    String sql = "Select cakeId, cakeName, imgPath, categoryId, quantity, description, price, createDate, expirationDate, status, createBy from Cake where cakeName"
                            + " LIKE N'%" + name + "%' and status = 0 order by createDate desc offset ? rows fetch next ? rows only";
                    preparedStatement = connection.prepareStatement(sql);
                    preparedStatement.setInt(1, (pageIndex - 1) * pageSize);
                    preparedStatement.setInt(2, pageSize);
                    resultSet = preparedStatement.executeQuery();

                } else if (fromPrice == 0 && toPrice == 0) {
                    String sql = "Select cakeId, cakeName, imgPath, categoryId, quantity, description, "
                            + "price, createDate, expirationDate, status, createBy "
                            + "from Cake where cakeName"
                            + " LIKE N'%" + name + "%' and status = 0 and categoryId = ? "
                            + "order by createDate desc "
                            + "offset ? rows fetch next ? rows only";
                    preparedStatement = connection.prepareStatement(sql);
                    preparedStatement.setString(1, selectCategoryId);
                    preparedStatement.setInt(2, (pageIndex - 1) * pageSize);
                    preparedStatement.setInt(3, pageSize);
                    resultSet = preparedStatement.executeQuery();
                } else {
                    String sql = "Select cakeId, cakeName, imgPath, categoryId, quantity, description, "
                            + "price, createDate, expirationDate, status, createBy "
                            + "from Cake where cakeName"
                            + " LIKE N'%" + name + "%' and status = 0 and price >= ? and price <= ? and categoryId = ? "
                            + "order by createDate desc "
                            + "offset ? rows fetch next ? rows only";
                    preparedStatement = connection.prepareStatement(sql);
                    preparedStatement.setFloat(1, fromPrice);
                    preparedStatement.setFloat(2, toPrice);
                    preparedStatement.setString(3, selectCategoryId);
                    preparedStatement.setInt(4, (pageIndex - 1) * pageSize);
                    preparedStatement.setInt(5, pageSize);
                    resultSet = preparedStatement.executeQuery();
                }
                result = new ArrayList<>();
                while (resultSet.next()) {
                    String cakeId = resultSet.getString("cakeId");
                    String cakeName = resultSet.getString("cakeName");
                    String imgPath = resultSet.getString("imgPath");
                    String categoryId = resultSet.getString("categoryId");
                    int quantity = resultSet.getInt("quantity");
                    String description = resultSet.getString("description");
                    float price = resultSet.getFloat("price");
                    Date createDate = resultSet.getDate("createDate");
                    Date expirationDate = resultSet.getDate("expirationDate");
                    int status = resultSet.getInt("status");
                    String createBy = resultSet.getString("createBy");
                    dto = new CakeDTO(cakeId, cakeName, imgPath, categoryId, quantity, description, price, createDate, expirationDate, status, createBy);
                    result.add(dto);
                }

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

    public int countCakeByLikeName(String name, String selectCategoryId, float fromPrice, float toPrice) throws SQLException, NamingException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        int result = 0;
        try {
            connection = DBUtils.makeConnection();
            if (connection != null) {
                if (selectCategoryId == null && fromPrice == 0 && toPrice == 0) {
                    String sql = "Select count(cakeId) from Cake where cakeName like N'%" + name + "%' and status = 0";
                    preparedStatement = connection.prepareStatement(sql);
                    resultSet = preparedStatement.executeQuery();
                } else if (fromPrice == 0 && toPrice == 0) {
                    String sql = "select count(cakeId) from Cake "
                            + "where cakeName like N'%" + name + "%' and status = 0 and categoryId = ?";
                    preparedStatement = connection.prepareStatement(sql);
                    preparedStatement.setString(1, selectCategoryId);
                    resultSet = preparedStatement.executeQuery();
                } else {
                    String sql = "select count(cakeId) from Cake "
                            + "where cakeName like N'%" + name + "%' and status = 0 and price >= ? and price <= ? and categoryId = ?";
                    preparedStatement = connection.prepareStatement(sql);
                    preparedStatement.setFloat(1, fromPrice);
                    preparedStatement.setFloat(2, toPrice);
                    preparedStatement.setString(3, selectCategoryId);
                    resultSet = preparedStatement.executeQuery();
                }
                if (resultSet.next()) {
                    result = resultSet.getInt(1);
                }
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

    public boolean insertCake(CakeDTO cakeDTO) throws NamingException, SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        boolean check = false;
        try {
            connection = DBUtils.makeConnection();
            String sql = "Insert into Cake (cakeId, cakeName, imgPath, categoryId, quantity, description, price, createDate, expirationDate, status, createBy)"
                    + " values(?, ?, ?, ?, ?, ?, ?, CAST( GETDATE() AS date), ?, 0, ?)";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, cakeDTO.getCakeId());
            preparedStatement.setString(2, cakeDTO.getCakeName());
            preparedStatement.setString(3, cakeDTO.getImgPath());
            preparedStatement.setString(4, cakeDTO.getCategoryId());
            preparedStatement.setInt(5, cakeDTO.getQuantity());
            preparedStatement.setString(6, cakeDTO.getDescription());
            preparedStatement.setFloat(7, cakeDTO.getPrice());
            preparedStatement.setDate(8, cakeDTO.getExpirationDate());
            preparedStatement.setString(9, cakeDTO.getCreateBy());
            int row = preparedStatement.executeUpdate();
            if (row > 0) {
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

    public boolean updateCake(CakeDTO cakeDTO) throws NamingException, SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        boolean check = false;
        try {
            connection = DBUtils.makeConnection();
            String sql = "Update Cake set cakeName = ?, imgPath = ?, categoryId = ?, quantity = ?, description = ?, price = ?, expirationDate = ?, status = ?"
                    + " where cakeId = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, cakeDTO.getCakeName());
            preparedStatement.setString(2, cakeDTO.getImgPath());
            preparedStatement.setString(3, cakeDTO.getCategoryId());
            preparedStatement.setInt(4, cakeDTO.getQuantity());
            preparedStatement.setString(5, cakeDTO.getDescription());
            preparedStatement.setFloat(6, cakeDTO.getPrice());
            preparedStatement.setDate(7, cakeDTO.getExpirationDate());
            preparedStatement.setInt(8, cakeDTO.getStatus());
            preparedStatement.setString(9, cakeDTO.getCakeId());
            int row = preparedStatement.executeUpdate();
            if (row > 0) {
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

    public CakeDTO getCakeById(String id) throws SQLException, NamingException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        CakeDTO result = null;
        try {
            connection = DBUtils.makeConnection();
            if (connection != null) {
                String sql = "Select cakeId, cakeName, imgPath, categoryId, quantity, description, price, createDate, expirationDate, status, createBy from Cake"
                        + " where cakeId = ?";
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, id);
                resultSet = preparedStatement.executeQuery();
                if (resultSet.next()) {
                    String cakeId = resultSet.getString("cakeId");
                    String cakeName = resultSet.getString("cakeName");
                    String imgPath = resultSet.getString("imgPath");
                    String categoryId = resultSet.getString("categoryId");
                    int quantity = resultSet.getInt("quantity");
                    String description = resultSet.getString("description");
                    float price = resultSet.getFloat("price");
                    Date createDate = resultSet.getDate("createDate");
                    Date expirationDate = resultSet.getDate("expirationDate");
                    int status = resultSet.getInt("status");
                    String createBy = resultSet.getString("createBy");
                    result = new CakeDTO(cakeId, cakeName, imgPath, categoryId, quantity, description, price, createDate, expirationDate, status, createBy);

                }
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

    public boolean checkCakeQuantity(String cakeId, int cakeQuantity) throws SQLException, NamingException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        boolean check = true;
        try {
            connection = DBUtils.makeConnection();
            if (connection != null) {
                String sql = "Select quantity from Cake"
                        + " where cakeId = ?";
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, cakeId);
                resultSet = preparedStatement.executeQuery();
                if (resultSet.next()) {
                    int quantity = resultSet.getInt("quantity");
                    if (quantity < cakeQuantity) {
                        check = false;
                    }
                }
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
        return check;
    }

    public boolean updateQuantity(String cakeId, int newQuantity) throws SQLException, NamingException {

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        boolean check = false;
        try {
            connection = DBUtils.makeConnection();
            String sql = "Update Cake set quantity = ?"
                    + " where cakeId = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setFloat(1, newQuantity);
            preparedStatement.setString(2, cakeId);
            int row = preparedStatement.executeUpdate();
            if (row > 0) {
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
}

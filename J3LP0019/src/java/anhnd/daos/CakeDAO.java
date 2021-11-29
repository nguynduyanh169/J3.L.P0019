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
                preparedStatement.close();
            }
            if (preparedStatement != null) {
                connection.close();
            }
            if (connection != null) {
                resultSet.close();
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
                preparedStatement.close();
            }
            if (preparedStatement != null) {
                connection.close();
            }
            if (connection != null) {
                resultSet.close();
            }
        }

        return result;
    }
}

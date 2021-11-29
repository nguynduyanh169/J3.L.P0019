/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhnd.daos;

import anhnd.dtos.CakeCategoryDTO;
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
public class CakeCategoryDAO {

    public CakeCategoryDAO() {
    }

    public List<CakeCategoryDTO> getCakeCategories() throws NamingException, SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        CakeCategoryDTO dto = null;
        List<CakeCategoryDTO> result = null;
        try {
            connection = DBUtils.makeConnection();
            String sql = "Select categoryId, categoryName from Category";
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            result = new ArrayList<>();
            while (resultSet.next()) {
                String categoryId = resultSet.getString("categoryId");
                String categoryName = resultSet.getString("categoryName");
                dto = new CakeCategoryDTO(categoryId, categoryName);
                result.add(dto);
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

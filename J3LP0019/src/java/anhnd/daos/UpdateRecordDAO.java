/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhnd.daos;

import anhnd.dtos.UpdateRecordDTO;
import anhnd.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.naming.NamingException;

/**
 *
 * @author anhnd
 */
public class UpdateRecordDAO {

    public UpdateRecordDAO() {
    }
    
    
    public boolean insertEditCakeHistory(UpdateRecordDTO updateRecordDTO) throws SQLException, NamingException{
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        boolean check = false;
        try {
            connection = DBUtils.makeConnection();
            String sql = "Insert into UpdateRecord (updateId, email, cakeId, updateDate)"
                    + " values (?, ?, ?, CAST( GETDATE() AS date))";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, updateRecordDTO.getUpdateId());
            preparedStatement.setString(2, updateRecordDTO.getEmail());
            preparedStatement.setString(3, updateRecordDTO.getCakeId());
            int row = preparedStatement.executeUpdate();
            if(row > 0){
                check = true;
            }
        } finally{
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

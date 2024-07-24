package crm.repository;

import crm.config.MySqlConnection;
import crm.model.Roles;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RoleRepository {

    public List<Roles> getRoles() throws SQLException {
        List<Roles> list = new ArrayList<>();

        Connection connection = MySqlConnection.getConnection();
        String query = "select * from roles";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Roles role = new Roles();
                role.setId(resultSet.getInt("id"));
                role.setRoleName(resultSet.getString("role_name"));
                role.setDescription(resultSet.getString("description"));

                list.add(role);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            if (connection != null) {
                connection.close();
            }
        }

        return list;
    }

    public int insertRoles(String name, String description) throws SQLException {
        Connection connection = MySqlConnection.getConnection();
        String query = "insert into roles(role_name, description) values (?, ?);";

        int isSuccess = 0;

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, description);

            isSuccess = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
        return isSuccess;
    }

    public int updateRoles(String name, String description, int id) throws SQLException {
        Connection connection = MySqlConnection.getConnection();
        PreparedStatement preparedStatement = null;
        String query = "UPDATE roles r SET r.role_name = ?, r.description = ? WHERE r.id = ?";

        int isSuccess = 0;

        try {

            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, description);
            preparedStatement.setInt(3, id);

            isSuccess = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
        return isSuccess;
    }

    public int deleteRoleById(int id) throws SQLException {
        Connection connection = MySqlConnection.getConnection();
        String query = "delete from roles r where r.id = ?";
        int isDelete = 0;

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);

            isDelete = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
        return isDelete;
    }
}

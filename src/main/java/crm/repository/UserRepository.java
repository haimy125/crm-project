package crm.repository;

import crm.config.MySqlConnection;
import crm.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserRepository {
    public List<User> getUserByUsernameAndPassword(String username, String password) throws SQLException {
        List<User> list = new ArrayList<>();

        Connection connection = MySqlConnection.getConnection();
        String query = "select * from users u where u.username = ? and u.password = ?";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                User user = new User();
                user.setId(resultSet.getInt("id"));
                user.setFullname(resultSet.getString("fullname"));
                user.setAge(resultSet.getInt("age"));
                user.setUsername(resultSet.getString("username"));

                list.add(user);
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
}

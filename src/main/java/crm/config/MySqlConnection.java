package crm.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySqlConnection {
	private static String DB_URL = "jdbc:mysql://localhost:3307/crm";
	private static String USER_NAME = "root";
	private static String PASSWORD = "admin123";

	public static Connection getConnection() {
		Connection connection = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
			return DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}

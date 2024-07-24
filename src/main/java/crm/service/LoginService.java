package crm.service;

import crm.model.User;
import crm.repository.UserRepository;

import java.sql.SQLException;
import java.util.List;

public class LoginService {

    private UserRepository userRepository = new UserRepository();

    public boolean checkLogin(String username, String password) throws SQLException {
        List<User> list = userRepository.getUserByUsernameAndPassword(username, password);

        return list.size() > 0 ? true : false;
    }
}

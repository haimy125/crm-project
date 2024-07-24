package crm.service;

import crm.model.Roles;
import crm.repository.RoleRepository;

import java.sql.SQLException;
import java.util.List;

public class RolesService {

    private final RoleRepository roleRepository = new RoleRepository();

    public List<Roles> getRoles() throws SQLException {
        return roleRepository.getRoles();
    }

    public boolean insertRoles(String name, String description) throws SQLException {
        return roleRepository.insertRoles(name, description) > 0;
    }
    
    public boolean updateRoles(String name, String description, int id) throws SQLException {
        return roleRepository.updateRoles(name, description, id) > 0;
    }

    public boolean deleteRoleById(int id) throws SQLException {
        return roleRepository.deleteRoleById(id) > 0;
    }
}

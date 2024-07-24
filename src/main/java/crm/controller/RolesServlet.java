package crm.controller;

import crm.common.Constant;
import crm.service.RolesService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "roleServlet", urlPatterns = {Constant.URL_ROLE, Constant.URL_ROLE_ADD})
public class RolesServlet extends HttpServlet {

    private RolesService rolesService = new RolesService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            req.setAttribute("roles", rolesService.getRoles());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        req.getRequestDispatcher("/role-table.jsp").forward(req, resp);

//        String urlPath = req.getServletPath();
//        switch (urlPath) {
//            case Constant.URL_ROLE:
//                getAllRoles(req, resp);
//                break;
//            case Constant.URL_ROLE_ADD:
//                addRoles(req, resp);
//                break;
//            default:
//                System.out.println("URL Không tồn tại!");
//                break;
//        }
    }

    private void getAllRoles(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            req.setAttribute("roles", rolesService.getRoles());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        req.getRequestDispatcher("/role-table.jsp").forward(req, resp);
    }

    private void addRoles(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/role-add.jsp").forward(req, resp);
    }
}

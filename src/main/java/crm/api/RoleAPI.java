package crm.api;

import com.google.gson.Gson;
import crm.common.Constant;
import crm.model.Roles;
import crm.payload.ResponseData;
import crm.service.RolesService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "RoleAPI", urlPatterns = {Constant.URL_ROLE_API, Constant.URL_ROLE_API_DELETE, Constant.URL_ROLE_API_ADD, Constant.URL_ROLE_API_UPDATE})
public class RoleAPI extends HttpServlet {

    private final RolesService rolesService = new RolesService();
    private final Gson gson = new Gson();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        getAllRoles(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String urlPath = req.getServletPath();

        switch (urlPath) {
            case Constant.URL_ROLE_API_DELETE:
                deleteRoles(req, resp);
                break;
            case Constant.URL_ROLE_API_ADD:
                addRoles(req, resp);
                break;
            case Constant.URL_ROLE_API_UPDATE:
                updateRoles(req, resp);
                break;
            default:
                System.out.println("URL Không tồn tại!");
                break;
        }
    }

    private void getAllRoles(HttpServletRequest req, HttpServletResponse resp) {
        boolean isSuccess = false;
        try {
            List<Roles> list = rolesService.getRoles();
            if (list.size() > 0) {
                isSuccess = true;
            }

            ResponseData data = new ResponseData();
            data.setSuccess(isSuccess);
            data.setDescription("");
            data.setData(list);

            String json = gson.toJson(data);

            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");

            PrintWriter printWriter = resp.getWriter();
            printWriter.print(json);
            printWriter.flush();

        } catch (SQLException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void addRoles(HttpServletRequest req, HttpServletResponse resp) {

        String roleName = req.getParameter("name");
        String description = req.getParameter("description");

        try {
            boolean isSuccess = rolesService.insertRoles(roleName, description);

            ResponseData data = new ResponseData();
            data.setSuccess(isSuccess);
            data.setDescription("");
            data.setData("");

            String json = gson.toJson(data);

            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");

            PrintWriter printWriter = resp.getWriter();
            printWriter.print(json);
            printWriter.flush();

        } catch (SQLException | IOException e) {
            throw new RuntimeException(e);
        }
    }


    private void updateRoles(HttpServletRequest req, HttpServletResponse resp) {

        String roleName = req.getParameter("name");
        String description = req.getParameter("description");
        int id = Integer.parseInt(req.getParameter("id"));

        try {
            boolean isSuccess = rolesService.updateRoles(roleName, description, id);

            ResponseData data = new ResponseData();
            data.setSuccess(isSuccess);
            data.setDescription("");
            data.setData("");

            String json = gson.toJson(data);

            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");

            PrintWriter printWriter = resp.getWriter();
            printWriter.print(json);
            printWriter.flush();

        } catch (SQLException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void deleteRoles(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));

        try {
            boolean isSuccess = rolesService.deleteRoleById(id);

            ResponseData data = new ResponseData();
            data.setSuccess(isSuccess);
            data.setDescription("");
            data.setData("");

            String json = gson.toJson(data);

            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            PrintWriter printWriter = resp.getWriter();
            printWriter.print(json);
            printWriter.flush();

        } catch (SQLException | IOException e) {
            throw new RuntimeException(e);
        }
    }
}

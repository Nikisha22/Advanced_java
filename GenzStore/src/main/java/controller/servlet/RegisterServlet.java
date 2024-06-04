package controller.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.DatabaseController;
import model.UserModel;
import utils.StringUtils;

@WebServlet(asyncSupported = true, urlPatterns = { "/RegisterServlet" })
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    DatabaseController dbController = new DatabaseController();

    public RegisterServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userName = request.getParameter(StringUtils.USER_NAME);
        String email = request.getParameter(StringUtils.EMAIL);
        String password = request.getParameter(StringUtils.PASSWORD);
        String role = request.getParameter("role");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String retypePassword = request.getParameter(StringUtils.RETYPE_PASSWORD);
        
        // Check if password and retype password match
        if (!password.equals(retypePassword)) {
            request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.PASSWORD_UNMATCHED_ERROR_MESSAGE);
            request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);
            return; // Return to prevent further execution
        }
        
        // Check if username is empty
        if (userName == null || userName.isEmpty()) {
            request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.USERNAME_EMPTY_MESSAGE);
            request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);
            return; // Return to prevent further execution
        }
        
        UserModel userModel = new UserModel();
        userModel.setUser_name(userName);
        userModel.setUser_email(email);
        userModel.setUser_password(password);
        userModel.setUser_role(role);
        userModel.setUser_phone(phone);
        userModel.setUser_address(address);
        
        int result = dbController.addUser(userModel);
        
        switch (result) {
            case 1:
                request.setAttribute(StringUtils.SUCCESS_MESSAGE, StringUtils.SUCCESS_REGISTER_MESSAGE);
                response.sendRedirect(request.getContextPath() + StringUtils.LOGIN_PAGE);
                break;
            case 0:
                request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.ERROR_REGISTER_MESSAGE);
                request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);
                break;
            case -1:
                request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.SERVER_ERROR_MESSAGE);
                request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);
                break;
            case -2:
                request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.USERNAME_ERROR_MESSAGE);
                request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);
                break;
            case -3:
                request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.EMAIL_ERROR_MESSAGE);
                request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);
                break;
            case -4:
                request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.PHONE_NUMBER_ERROR_MESSAGE);
                request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);
                break;
            default:
                request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.SERVER_ERROR_MESSAGE);
                request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);
        }
    }
}

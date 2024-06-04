package controller.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.DatabaseController;
import model.UserModel;
import utils.StringUtils;

/**
 * Servlet implementation class ProfileServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/ProfileServlet" })
public class ProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private DatabaseController dbController = new DatabaseController();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve username from session
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("user");
        
        String action = request.getParameter("action"); // Get the action parameter

        if ("edit".equals(action)) {
            // Forward to the edit page
            try {
                UserModel user = dbController.getUserDetails(username);
                request.setAttribute("userdata", user);
                request.getRequestDispatcher(StringUtils.EDIT_PROFILE_PAGE).forward(request, response);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
                request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.ERROR_LOGIN_MESSAGE);
                request.getRequestDispatcher(StringUtils.LOGIN_PAGE).forward(request, response);
            }
        } else {
            // Fetch user details for the profile page
            try {
                UserModel user = dbController.getUserDetails(username);
                request.setAttribute("userdata", user);
                request.getRequestDispatcher(StringUtils.PROFILE_PAGE).forward(request, response);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
                request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.ERROR_LOGIN_MESSAGE);
                request.getRequestDispatcher(StringUtils.LOGIN_PAGE).forward(request, response);
            }
        }
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter(StringUtils.USER_NAME);
		String email = request.getParameter(StringUtils.EMAIL);
		String phoneNumber = request.getParameter(StringUtils.PHONE_NUMBER);
		String address = request.getParameter(StringUtils.ADDRESS);
		UserModel userModel = new UserModel();
		userModel.setUser_name(userName);
		userModel.setUser_email(email);
		userModel.setUser_phone(phoneNumber);
		userModel.setUser_address(address);

		
		int result = dbController.updateUserInfo(userModel);
		switch (result) {
		case 1 -> {
			request.setAttribute(StringUtils.SUCCESS_MESSAGE, StringUtils.SUCCESS_REGISTER_MESSAGE);
		    response.sendRedirect(request.getContextPath() + StringUtils.PROFILE_SERVLET);
		}
		
		}
		
	}
		
}

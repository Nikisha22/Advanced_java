package controller.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import controller.DatabaseController;
import utils.StringUtils;
import model.SendMessageModel;


/**
 * Servlet implementation class SendMessageServlet
 */
@WebServlet(asyncSupported = true, urlPatterns =StringUtils.SEND_MESSAGE_SERVLET)
public class SendMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	  private DatabaseController dbController = new DatabaseController();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendMessageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 try {
             // Fetch messages from the database
             List<SendMessageModel> messages = dbController.getAllMessages();
             request.setAttribute("messages", messages);
             request.getRequestDispatcher("pages/Message.jsp").forward(request, response);
         } catch (Exception e) {
             e.printStackTrace();
             response.sendRedirect("error.jsp");
         }
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)    throws ServletException, IOException {
        String name = request.getParameter(StringUtils.NAME);
        String email = request.getParameter(StringUtils.EMAILS);
        String phone = request.getParameter(StringUtils.PHONE);
        String message = request.getParameter(StringUtils.MESSAGE);

        String result = DatabaseController.sendMessage(name, email,phone, message);

        if (result != null) {
        	request.setAttribute(StringUtils.SUCCESS_MESSAGE, StringUtils.SUCCESS_SEND_MESSAGE);
        	request.getRequestDispatcher(StringUtils.HOME_PAGE).forward(request, response);
            
     
        } else {
        	request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.ERROR_SEND_MESSAGE);
        }

	}
}

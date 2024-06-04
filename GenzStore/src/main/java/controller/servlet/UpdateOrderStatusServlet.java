package controller.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.DatabaseController;

/**
 * Servlet implementation class UpdateOrderStatusServlet
 */
@WebServlet("/UpdateOrderStatusServlet")
public class UpdateOrderStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DatabaseController dbController = new DatabaseController();
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateOrderStatusServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            System.out.print(orderId);
           
            boolean statusUpdated = dbController.updateOrderStatus(orderId);
            if (statusUpdated) {
                response.sendRedirect(request.getContextPath() + "/AdminOrderServlet");
            } else {
               System.out.println("Failed to update");
            }
        }

}

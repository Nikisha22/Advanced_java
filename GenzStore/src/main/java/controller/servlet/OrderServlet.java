package controller.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.DatabaseController;
import model.OrderModel;
import utils.StringUtils;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private DatabaseController dbController = new DatabaseController();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("user");
        String[] cartId = request.getParameterValues("cart_Id");
        String[] productName = request.getParameterValues("product_name");
        String[] status = request.getParameterValues("Status");
        String[] totalAmount = request.getParameterValues("total_Amount");
        String[] quantities = request.getParameterValues("quantity");

        for (int i = 0; i < cartId.length; i++) {
            int cart_Id = Integer.parseInt(cartId[i]);
            System.out.print(cartId);
            String productname = (productName[i]);
            boolean orderStatus = Boolean.parseBoolean(status[i]);
            float amount = Float.parseFloat(totalAmount[i]);
            int quantity = Integer.parseInt(quantities[i]);
            OrderModel orders = new OrderModel(orderStatus,cart_Id,amount,username, productname, quantity);


            int result = dbController.addOrder(orders);
            
            if (result == 1) {
//            	request.setAttribute(StringUtils.SUCCESS_MESSAGE, StringUtils.SUCCESS_ORDER);
//                response.sendRedirect(request.getContextPath() + StringUtils.HOME_PAGE);
//           
                int deleteResult = dbController.deleteCartItem(cart_Id);
               
                if (deleteResult == 1) {
                   System.out.println("Cart item deleted successfully.");
                   
               } else {
            	   System.out.println("Failed to delete cart item.");
            }
            } else {
            	request.setAttribute(StringUtils.SUCCESS_MESSAGE, StringUtils.ORDER_ERROR_MESSAGE);
            }
        	}
        response.sendRedirect(request.getContextPath() + "/" + "AddToCartServlet");

        }

}

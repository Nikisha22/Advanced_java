
package controller.servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

import controller.DatabaseController;
import model.CartModel;
import utils.StringUtils;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private DatabaseController dbController = new DatabaseController();

    public AddToCartServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("user");
        if (username == null) {
            request.getRequestDispatcher("/pages/Login.jsp").forward(request,response); // Redirect to login page
        }

        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        CartModel cartmodel = new CartModel(quantity,productId,username);
        
        int result = dbController.AddToCart(cartmodel);
    	switch (result) {
		case 1 -> {
			request.setAttribute(StringUtils.SUCCESS_MESSAGE, StringUtils.SUCCESS_ADDED_CART);
			response.sendRedirect(request.getContextPath() + "/" + "AddToCartServlet");
		  
		}
		case 0 -> {
			request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.ERROR_REGISTER_MESSAGE);
		   
		}}
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	  HttpSession session = request.getSession();
          String username = (String) session.getAttribute("user");
    	List<CartModel> carts;
		try {
		    carts = dbController.getAllCart(username);
		    request.setAttribute("cart", carts);

		    // Forward the request to the product.jsp page
		    request.getRequestDispatcher("pages/Cart.jsp").forward(request, response); 
		} catch (Exception e) {
		    e.printStackTrace();
		}
   
    }
    
}

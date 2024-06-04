package controller.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.DatabaseController;
import model.CartModel;

@WebServlet("/DeleteCartServlet")
public class DeleteCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private DatabaseController dbController = new DatabaseController();

    public DeleteCartServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	  HttpSession session = request.getSession();
          String username = (String) session.getAttribute("user");
          if (username == null) {
              request.getRequestDispatcher("/pages/Login.jsp").forward(request, response); // Redirect to login page
              return;
          }

          String cartIdParam = request.getParameter("cartItemId");
          if (cartIdParam != null) {
              int cartId = Integer.parseInt(cartIdParam);
              dbController.deleteCartItem(cartId);
              response.sendRedirect(request.getContextPath() + "/DeleteCartServlet");
              return;
          }
          // Retrieve cart items and forward to Cart.jsp
          List<CartModel> carts = null;
          carts = dbController.getAllCart(username);
          request.setAttribute("cart", carts);
          request.getRequestDispatcher("pages/Cart.jsp").forward(request, response);
    }
}
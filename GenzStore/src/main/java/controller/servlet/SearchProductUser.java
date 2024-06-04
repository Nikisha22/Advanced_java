package controller.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.DatabaseController;
import controller.ProductController;
import model.ProductModel;

@WebServlet("/SearchProductUser")
public class SearchProductUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ProductController productController;

    @Override
    public void init() throws ServletException {
        super.init();
        // Obtain a connection from DatabaseController
        Connection connection = null;
        try {
            connection = DatabaseController.getConnection();
        } catch (SQLException | ClassNotFoundException e) {
            // Handle connection error
            e.printStackTrace();
            throw new ServletException("Failed to obtain database connection.", e);
        }
        productController = new ProductController(connection);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchQuery = request.getParameter("searchQuery");
        
        // Call searchProducts method from ProductController
        List<ProductModel> searchResults = productController.searchProducts(searchQuery);

        request.setAttribute("products", searchResults);
        request.getRequestDispatcher("pages/Product.jsp").forward(request, response);
    }
}
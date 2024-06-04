package controller.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.DatabaseController;
import model.ProductModel;

@WebServlet("/UpdateProductServlet")
public class UpdateProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward the request to the updateProduct.jsp page
        request.getRequestDispatcher("/pages/updateProduct.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the request parameters
        String productIdStr = request.getParameter("productId");
        String productName = request.getParameter("productName");
        String productDescription = request.getParameter("productDescription");
        String productImage = request.getParameter("productImage");
        String productPriceStr = request.getParameter("productPrice");
        String productStockStr = request.getParameter("productStock");

        // Check if productIdStr, productPriceStr, and productStockStr are not empty
        if (productIdStr != null && !productIdStr.isEmpty() && productPriceStr != null && !productPriceStr.isEmpty()
                && productStockStr != null && !productStockStr.isEmpty()) {
            try {
                // Parse productId, productPrice, and productStock into numerical types
                int productId = Integer.parseInt(productIdStr);
                double productPrice = Double.parseDouble(productPriceStr);
                int productStock = Integer.parseInt(productStockStr);

                // Establish database connection
                try (Connection connection = DatabaseController.getConnection()) {
                    // Update the product details in the database
                    String sql = "UPDATE product SET product_name = ?, product_description = ?, product_price = ?, product_stock = ?, product_image = ? WHERE product_id = ?";
                    try (PreparedStatement statement = connection.prepareStatement(sql)) {
                        statement.setString(1, productName);
                        statement.setString(2, productDescription);
                        statement.setDouble(3, productPrice);
                        statement.setInt(4, productStock);
                        statement.setString(5, productImage);
                        statement.setInt(6, productId);

                        int rowsUpdated = statement.executeUpdate();
                        if (rowsUpdated > 0) {
                            // Redirect to the product list page upon successful update
                        	response.sendRedirect(request.getContextPath() + "/AdminProductList");
                            return; // Ensure the method exits after redirection
                        } else {
                            // Set error message attribute and forward to update page
                            request.setAttribute("error", "Failed to update product");
                        }
                    }
                } catch (SQLException | ClassNotFoundException e) {
                    // Handle SQLException
                    e.printStackTrace();
                    // Set error message attribute and forward to update page
                    request.setAttribute("error", "Database error: " + e.getMessage());
                }
            } catch (NumberFormatException e) {
                // Handle the case where productIdStr, productPriceStr, or productStockStr is not a valid number
                // For example, display an error message to the user
                request.setAttribute("error", "Invalid input for product details: " + e.getMessage());
            }
        } else {
            // Handle the case where one of the parameters is empty
            // For example, display an error message to the user
            request.setAttribute("error", "Required fields cannot be empty");
        }

        // If execution reaches here, it means an error occurred
        // Forward the request to the updateProduct.jsp page
        request.getRequestDispatcher("/pages/updateProduct.jsp").forward(request, response);
        System.out.println("here");
    }
}
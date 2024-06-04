package controller.servlet;

import java.io.File;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import controller.ProductController;
import model.ProductModel;
import controller.DatabaseController; // Import DatabaseController

@WebServlet("/AddProduct")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class AddProduct extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle GET requests here
        // For example, you can redirect or forward the request to a different page
        response.sendRedirect(request.getContextPath() + "/pages/addProduct.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtain a Connection object
        Connection connection=null;
		try {
			connection = DatabaseController.getConnection();
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        String name = request.getParameter("product-name");
        String description = request.getParameter("product-description");
        double price = Double.parseDouble(request.getParameter("selling-price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        Part filePart = request.getPart("product-image");
        String imageName = UUID.randomUUID().toString() + "_" + extractFileName(filePart);
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        String imagePath = uploadPath + File.separator + imageName;
        filePart.write(imagePath);

        ProductModel product = new ProductModel();
        product.setProduct_name(name);
        product.setProduct_description(description);
        product.setProduct_image(imagePath); // Store image path in the database
        product.setProduct_price(price);
        product.setProduct_stock(quantity);

        // Pass the Connection object to the ProductController constructor
        ProductController productController = new ProductController(connection);
        try {
			productController.addProduct(product);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        response.sendRedirect(request.getContextPath() + "/adminProductList.jsp");
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] tokens = contentDisp.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length() - 1);
            }
        }
        return "";
    }
}
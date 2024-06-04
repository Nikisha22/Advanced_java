package controller;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import model.ProductModel;

public class ProductController {
    private ProductDAO productDAO;

    public ProductController(Connection connection) {
        this.productDAO = new ProductDAO(connection);
    }

    public void addProduct(ProductModel product)throws SQLException {
        productDAO.addProduct(product);
    }
    public boolean updateProduct(ProductModel product) {
        return productDAO.updateProduct(product);
    }

    public List<ProductModel> searchProducts(String searchQuery) {
        return productDAO.searchProducts(searchQuery);
    }
}
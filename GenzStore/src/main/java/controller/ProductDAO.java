package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.ProductModel;

public class ProductDAO {
    private Connection connection;

    public ProductDAO(Connection connection) {
        this.connection = connection;
    }

    public List<ProductModel> searchProducts(String searchQuery) {
        List<ProductModel> searchResults = new ArrayList<>();
        String sql = "SELECT * FROM product WHERE product_name LIKE ? OR product_price = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            // Assuming you want to search for products containing the search query in name
            statement.setString(1, "%" + searchQuery + "%");

            // Assuming you also want to search for products with an exact price match
            double price = 0;
            try {
                price = Double.parseDouble(searchQuery);
            } catch (NumberFormatException e) {
                // Ignore parsing errors, and treat it as an empty price search
            }
            statement.setDouble(2, price);

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                ProductModel product = new ProductModel();
                product.setProduct_id(resultSet.getInt("product_id"));
                product.setProduct_name(resultSet.getString("product_name"));
                product.setProduct_description(resultSet.getString("product_description"));
                product.setProduct_price(resultSet.getDouble("product_price"));
                product.setProduct_stock(resultSet.getInt("product_stock"));
                product.setProduct_image(resultSet.getString("product_image"));

                searchResults.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return searchResults;
    }


    public void addProduct(ProductModel product) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(
                "INSERT INTO product (product_name, product_description, product_image, product_price, product_stock) VALUES (?, ?, ?, ?, ?)");
            preparedStatement.setString(1, product.getProduct_name());
            preparedStatement.setString(2, product.getProduct_description());
            preparedStatement.setString(3, product.getProduct_image());
            preparedStatement.setDouble(4, product.getProduct_price());
            preparedStatement.setInt(5, product.getProduct_stock());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public boolean updateProduct(ProductModel product) {
        String sqlUpdate = "UPDATE product SET product_name = ?, product_description = ?, product_price = ?, product_stock = ?, product_image = ? WHERE product_Id = ?";

        try (PreparedStatement statement = connection.prepareStatement(sqlUpdate)) {
            statement.setString(1, product.getProduct_name());
            statement.setString(2, product.getProduct_description());
            statement.setDouble(3, product.getProduct_price());
            statement.setInt(4, product.getProduct_stock());
            statement.setString(5, product.getProduct_image());
            statement.setInt(6, product.getProduct_id()); // Set product_id for update

            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
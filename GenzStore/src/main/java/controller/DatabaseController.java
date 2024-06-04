package controller;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.CartModel;
import model.OrderModel;
import model.PasswordEncryptionWIthAes;
import model.ProductModel;
import model.SendMessageModel;
import model.UserModel;
import utils.StringUtils;

public class DatabaseController {

	 public static Connection getConnection() throws SQLException, ClassNotFoundException {
	        Class.forName("com.mysql.jdbc.Driver");
	        String url = "jdbc:mysql://localhost:3306/genzstore";
	        String user = "root";
	        String pass = "";
	        return DriverManager.getConnection(url, user, pass);
	    }

	    public int addUser(UserModel userModel) {
	        try (Connection con = getConnection()) {
	            PreparedStatement st = con.prepareStatement(StringUtils.INSERT_USER);

	            PreparedStatement checkUsernameSt = con.prepareStatement(StringUtils.GET_USERNAME);
	            checkUsernameSt.setString(1, userModel.getUser_name());
	            ResultSet checkUsernameRs = checkUsernameSt.executeQuery();

	            checkUsernameRs.next();

	            if (checkUsernameRs.getInt(1) > 0) {
	                return -2; // Username already exists
	            }

	            PreparedStatement checkEmailSt = con.prepareStatement(StringUtils.GET_EMAIL);
	            checkEmailSt.setString(1, userModel.getUser_email());
	            ResultSet checkEmailRs = checkEmailSt.executeQuery();

	            checkEmailRs.next();

	            if (checkEmailRs.getInt(1) > 0) {
	                return -3; // Email already exists
	            }

	            // Encrypt password before storing it in the database
	            String encryptedPassword = PasswordEncryptionWIthAes.encryptPassword(userModel.getUser_password(), "U3CdwubLD5yQbUOG92ZnHw==");
	            st.setString(1, userModel.getUser_name());
	            st.setString(3, userModel.getUser_email());
	            st.setString(2, encryptedPassword);

	            
	            int result = st.executeUpdate();
	            return result > 0 ? 1 : 0;
	        } catch (SQLException | ClassNotFoundException ex) {
	            ex.printStackTrace(); // Log the exception for debugging
	            return -1;
	        } catch (Exception e) {
	            e.printStackTrace();
	            return -1;
	        }
	    }

	    public int getUserLoginInfo(String username, String password) {
	        try (Connection con = getConnection()) {
	            PreparedStatement st = con.prepareStatement(StringUtils.GET_LOGIN_USER_INFO);
	            st.setString(1, username);

	            ResultSet rs = st.executeQuery();

	            if (rs.next()) {
	                String userDb = rs.getString("user_name");
	                String encryptedPassword = rs.getString("user_password");

	                // Decrypt password from database and compare
	                String decryptedPassword = PasswordEncryptionWIthAes.decryptPassword(encryptedPassword, "U3CdwubLD5yQbUOG92ZnHw==");

	                if (decryptedPassword!=null && userDb.equals(username) && decryptedPassword.equals(password)) {
	                    return 1; // Login successful
	                } else {
	                    return 0; // Password mismatch
	                }
	            } else {
	                // No matching record found
	                return 0;
	            }
	        } catch (SQLException | ClassNotFoundException ex) {
	            ex.printStackTrace(); // Log the exception for debugging
	            return -1;
	        } catch (Exception e) {
	            e.printStackTrace();
	            return -1;
	        }
	    }
	    
	    public UserModel getUserDetails(String username) throws ClassNotFoundException {
	        try {
	            Connection connection = getConnection();
	            PreparedStatement statement = connection.prepareStatement(StringUtils.GET_LOGIN_USER_INFO);
	            statement.setString(1, username);
	            ResultSet table = statement.executeQuery();
	            if (table.next()) {
	            	UserModel user = new UserModel();
	                user.setUser_name(table.getString("user_name"));
	                user.setUser_email(table.getString("user_email"));
	                user.setUser_phone(table.getString("user_phone"));
	                user.setUser_address(table.getString("user_address"));
	                user.setUser_role(table.getString("user_role"));
	                user.setUser_password(table.getString("user_password"));
	                
	                
	                return user;
	            } else {
	                // No user found with the given username
	                return null;
	            }
	        } catch (SQLException e) {
	            e.printStackTrace(); // Handle or log the exception as needed
	            return null;
	        }
	    }
	   
	    public int updateUserInfo(UserModel userModel) {
	        try (Connection con = getConnection();
	             PreparedStatement st = con.prepareStatement("UPDATE user SET user_name=?, user_email=?, user_phone=?, user_address=? WHERE user_name=?")) {
	        
	        	st.setString(1, userModel.getUser_name());
	            st.setString(2, userModel.getUser_email());
	            st.setString(3, userModel.getUser_phone());
	            st.setString(4, userModel.getUser_address());  
	            st.setString(5, userModel.getUser_name());

	            int result = st.executeUpdate();
	            return result > 0 ? 1 : 0;
	        } catch (SQLException | ClassNotFoundException ex) {
	            ex.printStackTrace(); // Log the exception for debugging
	            return -1;
	        }
	    }


	    

	   
	    public static String sendMessage(String name, String email,String phone, String message) {
	        try (Connection con = getConnection();
	             PreparedStatement pt = con.prepareStatement(StringUtils.INSERT_MESSAGE)) {
	            pt.setString(1, name);
	            pt.setString(2, email);
	            pt.setString(3, phone);
	            pt.setString(4, message);
	            int result = pt.executeUpdate();
	            if (result >= 1) {
	                return "Successfully Added";
	            }
	            return null;
	        } catch (SQLException | ClassNotFoundException e) {
	            e.printStackTrace(); // Handle or log the exception as needed
	            return null;
	        }
	    }
	    
	    public List<SendMessageModel> getAllMessages() {
	        List<SendMessageModel> messages = new ArrayList<>();
	        try (Connection con = getConnection()){
	        		 PreparedStatement st = con.prepareStatement(StringUtils.GET_ALL_MESSAGE);
	        		  ResultSet rs = st.executeQuery();
	           
	            while (rs.next()) {
	                
	            	SendMessageModel message = new SendMessageModel();
	                message.setMessage(rs.getString("message"));
	                message.setName(rs.getString("name"));
	                message.setEmail(rs.getString("email"));
	                message.setPhoneNumber(rs.getString("phone_number"));
	                // Add the message to the list
	                messages.add(message);
	            }
	        }catch (SQLException | ClassNotFoundException ex) {
	            ex.printStackTrace(); // Log the exception for debugging
	        }
	        return messages;
	    }
	    
	    public ProductModel getProductbyId(String id) throws ClassNotFoundException {
	        try {
	            Connection connection = getConnection();
	            PreparedStatement statement = connection.prepareStatement(StringUtils.GET_PRODUCT_INFO);
	            statement.setString(1, id);
	            ResultSet resultSet = statement.executeQuery();
	            if (resultSet.next()) {
	            	ProductModel product = new ProductModel();
	                product.setProduct_id(resultSet.getInt("product_Id"));
	                product.setProduct_name(resultSet.getString("product_name"));
	                product.setProduct_description(resultSet.getString("product_description"));
	                product.setProduct_image(resultSet.getString("product_image"));
	                product.setProduct_price(resultSet.getDouble("product_price"));
	                product.setProduct_stock(resultSet.getInt("product_stock"));
	                
	                
	                return product;
	            } else {
	                // No user found with the given username
	                return null;
	            }
	        } catch (SQLException e) {
	            e.printStackTrace(); // Handle or log the exception as needed
	            return null;
	        }
	    }
	    public static int AddToCart(CartModel cartModel) {
	    	   try (Connection con = getConnection();
	  	             PreparedStatement pt = con.prepareStatement(StringUtils.INSERT_CART)) {
	    		   pt.setInt(1, cartModel.getQuantity());
	  	            pt.setInt(2,cartModel.getProduct_Id() );
	  	            pt.setString(3, cartModel.getUsername());
	  	            int result = pt.executeUpdate();
	  	          return result > 0 ? 1 : 0;
		        } catch (SQLException | ClassNotFoundException ex) {
		            ex.printStackTrace(); // Log the exception for debugging
		            return -1;
		        } catch (Exception e) {
		            e.printStackTrace();
		            return -1;
		        }
	    }
	    
	    public List<CartModel> getAllCart( String username) {
	        List<CartModel> cart = new ArrayList<>();
	        try (Connection con = getConnection()){
	        		 PreparedStatement st = con.prepareStatement(StringUtils.GET_CART);
	        		 st.setString(1, username);
	        		  ResultSet rs = st.executeQuery();
	           
	            while (rs.next()) {
	    
	            	CartModel addToCart = new CartModel();
	            	ProductModel product = new ProductModel();
	            	
	            	
	            	addToCart.setQuantity(rs.getInt("quantity"));
	            	addToCart.setProduct_Id(rs.getInt("product_Id"));
	            	addToCart.setCart_Id(rs.getInt("cart_Id"));
	            	 product.setProduct_name(rs.getString("product_name"));
	                 product.setProduct_description(rs.getString("product_description"));
	                 product.setProduct_image(rs.getString("product_image"));
	                 product.setProduct_price(rs.getDouble("product_price"));
	                 addToCart.setProductModel(product);
	                cart.add(addToCart);
	            }
	        }catch (SQLException | ClassNotFoundException ex) {
	            ex.printStackTrace(); // Log the exception for debugging
	        }
	        return cart;
	    }
	    
	    public int deleteCartItem(int cartId) {
	        try (Connection con = getConnection();
	             PreparedStatement st = con.prepareStatement(StringUtils.DELETE_CART)) {
	            st.setInt(1, cartId);
	            st.executeUpdate();
	        } catch (SQLException | ClassNotFoundException ex) {
	            ex.printStackTrace(); // Log the exception for debugging
	        }
			return 1;
	    }
	    
	    public int addOrder(OrderModel orderModel) {
	        try (Connection con = getConnection();
	             PreparedStatement st = con.prepareStatement(StringUtils.INSERT_ORDER)) {
	        	 st.setBoolean(1, orderModel.isOrder_Status());
	  	            st.setDouble(2,orderModel.getTotalAmount());
	  	            st.setString(3, orderModel.getUser_name());
	  	        st.setInt(4, orderModel.getCart_Id());
	  	      st.setString(5, orderModel.getProduct_name());
	  	    st.setInt(6, orderModel.getQuantity());
	  	      int result = st.executeUpdate();
	            return result > 0 ? 1 : 0;
	        } catch (SQLException | ClassNotFoundException ex) {
	            ex.printStackTrace(); // Log the exception for debugging
	            return -1;
	        }
	    }
	    public List<OrderModel> getAllOrder() {
	        List<OrderModel> orders = new ArrayList<>();
	        try (Connection con = getConnection()){
	        		 PreparedStatement st = con.prepareStatement(StringUtils.GET_ORDERS);
	        		  ResultSet rs = st.executeQuery();
	           
	            while (rs.next()) {
	                
	            	OrderModel order = new OrderModel();
	                order.setTotalAmount(rs.getDouble("total_amount"));
	                order.setUser_name(rs.getString("user_name"));
	                order.setProduct_name(rs.getString("product_name"));
	                order.setCart_Id(rs.getInt("cart_Id"));
	                order.setOrder_Status(rs.getBoolean("order_status"));
	                order.setQuantity(rs.getInt("quantity"));
	                order.setOrder_Id(rs.getInt("Order_Id"));
	                orders.add(order);
	            }
	        }catch (SQLException | ClassNotFoundException ex) {
	            ex.printStackTrace(); // Log the exception for debugging
	        }
	        return orders;
	    }	
	    public List<OrderModel> getOrderHistoryByUsername(String username) {
	        List<OrderModel> orders = new ArrayList<>();
	        try (Connection con = getConnection();
	             PreparedStatement st = con.prepareStatement(StringUtils.GET_ORDER_HISTORY)) {
	            st.setString(1, username);
	            ResultSet rs = st.executeQuery();
	            while (rs.next()) {
	                OrderModel order = new OrderModel();
	                order.setTotalAmount(rs.getDouble("total_amount"));
	                order.setUser_name(rs.getString("user_name"));
	                order.setProduct_name(rs.getString("product_name"));
	                order.setCart_Id(rs.getInt("cart_Id"));
	                order.setOrder_Status(rs.getBoolean("order_status"));
	                order.setQuantity(rs.getInt("quantity"));
	                order.setOrder_Id(rs.getInt("Order_Id"));
	                orders.add(order);
	            }
	        } catch (SQLException | ClassNotFoundException ex) {
	            ex.printStackTrace(); // Log the exception for debugging
	        }
	        return orders;
	    }

	    
	    
	    public boolean updateOrderStatus(int orderId) {
	        try (Connection con = getConnection();
	             PreparedStatement st = con.prepareStatement(StringUtils.UPDATE_ORDER_STATUS)) {
	  
	            st.setInt(1, orderId);
	            // Execute the update query
	            int rowsAffected = st.executeUpdate();
	            // Return true if the update was successful
	            return rowsAffected > 0;
	        } catch (SQLException | ClassNotFoundException ex) {
	            ex.printStackTrace();
	            return false;
	        }
	    }

}

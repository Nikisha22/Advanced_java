package utils;

public class StringUtils {
	public static final String INSERT_USER = "INSERT INTO user"
			+ "(user_name,user_password,user_email)"
			+ "VALUES (?, ?, ?)";
	public static final String INSERT_MESSAGE = "INSERT INTO message"
			+ "(name,email,phone_number,message)"
			+ "VALUES (?, ?, ?,?)";
	public static final String INSERT_CART = "INSERT INTO cart"
			+ "(quantity,product_Id,user_name)"
			+ "VALUES (?, ?, ?)";
	public static final String UPDATE_USER= "UPDATE user SET "
	        + "user_name = ?, user_email = ?, user_phone = ?, user_address = ?"
	        + "WHERE user_id = ?";
	public static String GET_PRODUCT_INFO = "SELECT * FROM product WHERE product_Id = ?";
	public static final String GET_LOGIN_USER_INFO = "SELECT * FROM user WHERE user_name = ?";
	public static final String GET_USERNAME = "SELECT COUNT(*) FROM user WHERE user_name = ?";
	public static final String GET_PHONE = "SELECT COUNT(*) FROM user WHERE user_phone= ?";
	public static final String GET_EMAIL = "SELECT COUNT(*) FROM user WHERE user_email = ?";
	public static final String GET_ALL_USER = "SELECT * FROM user";
	public static final String GET_ALL_MESSAGE = "SELECT * FROM message";
	public static final String GET_ALL_PRODUCT = "SELECT * FROM product";
	public static final String GET_CART = "SELECT cart.cart_Id,cart.product_Id, product.Product_name, product.product_image,product.product_price,product.product_description, cart.quantity FROM cart JOIN product ON cart.product_Id = product.Product_Id WHERE cart.user_name = ?";
	public static final String DELETE_CART = "DELETE FROM cart WHERE cart_Id = ?";
	public static final String GET_ORDER = "SELECT orders.order_Id, orders.order_Status, orders.total_amount, product.product_name, product.product_image, product.product_price, product.product_description, user.user_name FROM orders JOIN cart ON orders.cart_Id = cart.cart_Id JOIN product ON cart.product_Id = product.product_Id JOIN user ON orders.user_name = user.user_name";
	public static final String GET_ORDERS = "SELECT * FROM orders";
	public static final String GET_ORDER_HISTORY= "SELECT * FROM orders WHERE user_name = ?";
	public static final String INSERT_ORDER = "INSERT INTO orders (order_status,total_amount,user_name,cart_Id,product_name,quantity)"
			+ "VALUES(?,?,?,?,?,?)";
	public static final String UPDATE_ORDER_STATUS = "UPDATE orders SET order_status = 1 WHERE order_Id = ?";
	// End SQL Queries


	// Start Parameter names
	public static final String USER_ID = "userid";
	public static final String USER_NAME = "username";
	public static final String EMAIL = "email";
	public static final String PHONE_NUMBER = "phoneNumber";
	public static final String ADDRESS = "address";
	public static final String PASSWORD = "password";
	public static final String ROLE = "role";
	public static final String RETYPE_PASSWORD= "retype-password";
	public static final String NAME = "name";
	public static final String MESSAGE = "message";
	public static final String EMAILS= "emails";
	public static final String PHONE = "phone";
	
	// End Parameter names


	// Start string messages 
	// Start register page messages
	public static final String SUCCESS_REGISTER_MESSAGE = "Successfully Registered!";
	public static final String ERROR_REGISTER_MESSAGE = "Please correct the form data.";
	public static final String SERVER_ERROR_MESSAGE = "An unexpected server error occurred.";
	public static final String USERNAME_ERROR_MESSAGE = "Username is already registered.";
	public static final String EMAIL_ERROR_MESSAGE = "Email is already registered.";
	public static final String PHONE_NUMBER_ERROR_MESSAGE = "Phone Number is already registered.";
	public static final String PASSWORD_UNMATCHED_ERROR_MESSAGE = "Password not matched.";
	public static final String SUCCESS_ADDED_CART = "Successfully Added to Cart.";
	public static final String  USERNAME_EMPTY_MESSAGE = "User Name is empty";
	public static final String  SUCCESS_ORDER= "Sucessfully Order!";
	// End register page messages
	
	// Start login page message
	public static final String SUCCESS_LOGIN_MESSAGE = "Successfully LoggedIn!";
	public static final String SUCCESS_SEND_MESSAGE = "Successfully message send!";
	public static final String ERROR_LOGIN_MESSAGE = "Either username or password is not correct!";
	public static final String ERROR_SEND_MESSAGE = "Failed to add message!";
	public static final String ORDER_ERROR_MESSAGE ="Failed to add order";
	
	// End login page message
	
	public static final String SUCCESS_MESSAGE = "successMessage";
	public static final String ERROR_MESSAGE = "errorMessage";
	// End string messages 


	// Start JSP Route
	public static final String LOGIN_PAGE = "/pages/Login.jsp";
	public static final String REGISTER_PAGE = "/pages/Register.jsp";
	public static final String HOME_PAGE = "/pages/Home.jsp";
	public static final String EDIT_PROFILE_PAGE = "/pages/EditProfile.jsp";
	public static final String PROFILE_PAGE = "/pages/Profile.jsp";
	public static final String ADMIN_PAGE= "/pages/AdminHome.jsp";
	public static final String CART_PAGE= "/pages/Cart.jsp";
	public static final String ORDER_HISTORY_PAGE= "/pages/OrderHistory.jsp";
	
	// End JSP Route
	
	// Start Servlet Route
	public static final String REGISTER_SERVLET = "/RegisterServlet";
	public static final String LOGIN_SERVLET = "/LoginServlet";
	public static final String SEND_MESSAGE_SERVLET = "/SendMessageServlet";
	public static final String PROFILE_SERVLET = "/ProfileServlet";

	// End Servlet Route

}

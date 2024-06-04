package model;

public class OrderModel {
	private int Order_Id;
	private boolean Order_Status;
	private int cart_Id;
	private double totalAmount;
	private String user_name;
	private String product_name;
	private int quantity;
	private CartModel cartModel;
	private UserModel userModel;
	public OrderModel(boolean order_Status, int cart_Id, double totalAmount, String user_name, String product_name,
			int quantity) {
		super();
		Order_Status = order_Status;
		this.cart_Id = cart_Id;
		this.totalAmount = totalAmount;
		this.user_name = user_name;
		this.product_name = product_name;
		this.quantity = quantity;
	}
	public OrderModel() {
		// TODO Auto-generated constructor stub
	}
	public int getOrder_Id() {
		return Order_Id;
	}
	public void setOrder_Id(int order_Id) {
		Order_Id = order_Id;
	}
	public boolean isOrder_Status() {
		return Order_Status;
	}
	public void setOrder_Status(boolean order_Status) {
		Order_Status = order_Status;
	}
	public int getCart_Id() {
		return cart_Id;
	}
	public void setCart_Id(int cart_Id) {
		this.cart_Id = cart_Id;
	}
	public double getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public CartModel getCartModel() {
		return cartModel;
	}
	public void setCartModel(CartModel cartModel) {
		this.cartModel = cartModel;
	}
	public UserModel getUserModel() {
		return userModel;
	}
	public void setUserModel(UserModel userModel) {
		this.userModel = userModel;
	}
	 
}

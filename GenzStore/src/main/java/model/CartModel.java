package model;

public class CartModel {
	private int cart_Id;
	private int quantity;
	private int product_Id;
	private String username;
	private ProductModel productModel;
	public CartModel(int quantity, int product_Id, String username) {
		super();
		
		this.quantity = quantity;
		this.product_Id = product_Id;
		this.username = username;
		this.productModel = productModel;
	}
	public CartModel() {
		// TODO Auto-generated constructor stub
	}
	public int getCart_Id() {
		return cart_Id;
	}
	public void setCart_Id(int cart_Id) {
		this.cart_Id = cart_Id;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getProduct_Id() {
		return product_Id;
	}
	public void setProduct_Id(int product_Id) {
		this.product_Id = product_Id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public ProductModel getProductModel() {
		return productModel;
	}
	public void setProductModel(ProductModel productModel) {
		this.productModel = productModel;
	}
	
}

package model;

public class UserModel{
	
	
	private int user_id;
	private String user_name;
	private String user_email;
	private String user_phone;
	private String user_password;
	private String user_address;
	private String user_role;

public UserModel(String user_name, String user_email, String user_phone, String user_password,
		String user_address, String user_role) {
	super();
	this.user_name = user_name;
	this.user_email = user_email;
	this.user_phone = user_phone;
	this.user_password = user_password;
	this.user_address = user_address;
	this.user_role = user_role;
}
public UserModel() {
	// TODO Auto-generated constructor stub
}
public int getUser_id() {
	return user_id;
}
public void setUser_id(int user_id) {
	this.user_id = user_id;
}
public String getUser_name() {
	return user_name;
}
public void setUser_name(String user_name) {
	this.user_name = user_name;
}
public String getUser_email() {
	return user_email;
}
public void setUser_email(String user_email) {
	this.user_email = user_email;
}
public String getUser_phone() {
	return user_phone;
}
public void setUser_phone(String user_phone) {
	this.user_phone = user_phone;
}
public String getUser_password() {
	return user_password;
}
public void setUser_password(String user_password) {
	this.user_password = user_password;
}
public String getUser_address() {
	return user_address;
}
public void setUser_address(String user_address) {
	this.user_address = user_address;
}
public String getUser_role() {
	return user_role;
}
public void setUser_role(String user_role) {
	this.user_role = user_role;
}
	
}

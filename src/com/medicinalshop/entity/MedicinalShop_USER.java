package com.medicinalshop.entity;

public class MedicinalShop_USER {
	private String USER_ID;
	private String USER_NAME;
	private String USER_PASSWORD;
	private String USER_SEX;
	private String USER_BIRTHDAY;
	private String USER_PHONE;
	private String USER_ADDRESS;
	private int USER_STATUS;
	public MedicinalShop_USER(String uSER_ID,String uSER_NAME,String uSER_PASSWORD,String uSER_SEX,
			String uSER_BIRTHDAY,String uSER_PHONE,String uSER_ADDRESS,int uSER_STATUS) {
		super();
		USER_ID = uSER_ID;
		USER_NAME = uSER_NAME;
		USER_PASSWORD = uSER_PASSWORD;
		USER_SEX = uSER_SEX;
		USER_BIRTHDAY = uSER_BIRTHDAY;
		USER_PHONE = uSER_PHONE;
		USER_ADDRESS = uSER_ADDRESS;
		USER_STATUS = uSER_STATUS;
	}
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}
	public String getUSER_NAME() {
		return USER_NAME;
	}
	public void setUSER_NAME(String uSER_NAME) {
		USER_NAME = uSER_NAME;
	}
	public String getUSER_PASSWORD() {
		return USER_PASSWORD;
	}
	public void setUSER_PASSWORD(String uSER_PASSWORD) {
		USER_PASSWORD = uSER_PASSWORD;
	}
	public String getUSER_SEX() {
		return USER_SEX;
	}
	public void setUSER_SEX(String uSER_SEX) {
		USER_SEX = uSER_SEX;
	}
	public String getUSER_BIRTHDAY() {
		return USER_BIRTHDAY;
	}
	public void setUSER_BIRTHDAY(String uSER_BIRTHDAY) {
		USER_BIRTHDAY = uSER_BIRTHDAY;
	}
	public String getUSER_PHONE() {
		return USER_PHONE;
	}
	public void setUSER_PHONE(String uSER_PHONE) {
		USER_PHONE = uSER_PHONE;
	}
	public String getUSER_ADDRESS() {
		return USER_ADDRESS;
	}
	public void setUSER_ADDRESS(String uSER_ADDRESS) {
		USER_ADDRESS = uSER_ADDRESS;
	}
	public int getUSER_STATUS() {
		return USER_STATUS;
	}
	public void setUSER_STATUS(int uSER_STATUS) {
		USER_STATUS = uSER_STATUS;
	}
}

package com.medicinalshop.entity;

public class MedicinalShop_PRODUCT {
	private String PRODUCT_ID;
	private String PRODUCT_NAME;
	private String PRODUCT_PHOTO;
	private int PRODUCT_PRICE;
	private int PRODUCT_NUM;
	private String PRODUCT_PID;
	
	public MedicinalShop_PRODUCT(String pRODUCT_ID, String pRODUCT_NAME, String pRODUCT_PHOTO,
			int pRODUCT_PRICE, int pRODUCT_NUM, String pRODUCT_PID) {
		super();
		PRODUCT_ID = pRODUCT_ID;
		PRODUCT_NAME = pRODUCT_NAME;
		PRODUCT_PHOTO = pRODUCT_PHOTO;
		PRODUCT_PRICE = pRODUCT_PRICE;
		PRODUCT_NUM = pRODUCT_NUM;
		PRODUCT_PID = pRODUCT_PID;
	}
	public String getPRODUCT_ID() {
		return PRODUCT_ID;
	}
	public void setPRODUCT_ID(String pRODUCT_ID) {
		PRODUCT_ID = pRODUCT_ID;
	}
	public String getPRODUCT_NAME() {
		return PRODUCT_NAME;
	}
	public void setPRODUCT_NAME(String pRODUCT_NAME) {
		PRODUCT_NAME = pRODUCT_NAME;
	}
	public String getPRODUCT_PHOTO() {
		return PRODUCT_PHOTO;
	}
	public void setPRODUCT_PHOTO(String pRODUCT_PHOTO) {
		PRODUCT_PHOTO = pRODUCT_PHOTO;
	}
	public int getPRODUCT_PRICE() {
		return PRODUCT_PRICE;
	}
	public void setPRODUCT_PRICE(int pRODUCT_PRICE) {
		PRODUCT_PRICE = pRODUCT_PRICE;
	}
	public int getPRODUCT_NUM() {
		return PRODUCT_NUM;
	}
	public void setPRODUCT_NUM(int pRODUCT_NUM) {
		PRODUCT_NUM = pRODUCT_NUM;
	}
	public String getPRODUCT_PID() {
		return PRODUCT_PID;
	}
	public void setPRODUCT_PID(String pRODUCT_PID) {
		PRODUCT_PID = pRODUCT_PID;
	}
	
}

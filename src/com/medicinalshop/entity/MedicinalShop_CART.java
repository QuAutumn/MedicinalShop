package com.medicinalshop.entity;

public class MedicinalShop_CART {
	private String USER_ID;
	private String PHOTO;
	private String PRODUCT_ID;
	private String NAME;
	private String PRICE;
	private String NUM;
	private String TOTAL;
	
	public MedicinalShop_CART(String uSER_ID,String pHOTO,String pRODUCT_ID,
			String nAME,String pRICE,String nUM,String tOTAL) {
		super();
		USER_ID = uSER_ID;
		PHOTO = pHOTO;
		PRODUCT_ID = pRODUCT_ID;
		NAME = nAME;
		PRICE = pRICE;
		NUM = nUM;
		TOTAL = tOTAL;
	}
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}
	public String getPHOTO() {
		return PHOTO;
	}
	public void setPHOTO(String pHOTO) {
		PHOTO = pHOTO;
	}
	public String getPRODUCT_ID() {
		return PRODUCT_ID;
	}
	public void setPRODUCT_ID(String pRODUCT_ID) {
		PRODUCT_ID = pRODUCT_ID;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public String getPRICE() {
		return PRICE;
	}
	public void setPRICE(String pRICE) {
		PRICE = pRICE;
	}
	public String getNUM() {
		return NUM;
	}
	public void setNUM(String nUM) {
		NUM = nUM;
	}
	public String getTOTAL() {
		return TOTAL;
	}
	public void setTOTAL(String tOTAL) {
		TOTAL = tOTAL;
	}
}

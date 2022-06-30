package com.medicinalshop.entity;

public class MedicinalShop_ORDER {
	private String USER_ID;
	private String USER_NAME;
	private String ORDER_ID;
	private String PHOTO;
	private String PRODUCT_ID;
	private String PRODUCT_NAME;
	private String NUM;
	private String TOTALPRICE;
	private String ADDRESS;
	private String PHONE;
	
	public MedicinalShop_ORDER(String uSER_ID,String uSER_NAME,String oRDER_ID,
			String pHOTO,String pRODUCT_ID,String pRODUCT_NAME,String nUM,
			String tOTALPRICE,String aDDRESS,String pHONE) {
		super();
		USER_ID = uSER_ID;
		USER_NAME = uSER_NAME;
		ORDER_ID = oRDER_ID;
		PHOTO = pHOTO;
		PRODUCT_ID = pRODUCT_ID;
		PRODUCT_NAME = pRODUCT_NAME;
		NUM = nUM;
		TOTALPRICE = tOTALPRICE;
		ADDRESS = aDDRESS;
		PHONE = pHONE;
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
	public String getORDER_ID() {
		return ORDER_ID;
	}
	public void setORDER_ID(String oRDER_ID) {
		ORDER_ID = oRDER_ID;
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
	public String getPRODUCT_NAME() {
		return PRODUCT_NAME;
	}
	public void setPRODUCT_NAME(String pRODUCT_NAME) {
		PRODUCT_NAME = pRODUCT_NAME;
	}
	public String getNUM() {
		return NUM;
	}
	public void setNUM(String nUM) {
		NUM = nUM;
	}
	public String getTOTALPRICE() {
		return TOTALPRICE;
	}
	public void setTOTALPRICE(String tOTALPRICE) {
		TOTALPRICE = tOTALPRICE;
	}
	public String getADDRESS() {
		return ADDRESS;
	}
	public void setADDRESS(String aDDRESS) {
		ADDRESS = aDDRESS;
	}
	public String getPHONE() {
		return PHONE;
	}
	public void setPHONE(String pHONE) {
		PHONE = pHONE;
	}
}

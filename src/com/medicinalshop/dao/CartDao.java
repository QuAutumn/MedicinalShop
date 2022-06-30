package com.medicinalshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.medicinalshop.entity.MedicinalShop_CART;

public class CartDao {
	public static ArrayList<MedicinalShop_CART> selectcartByuid(String userid) {
		ArrayList<MedicinalShop_CART> list = new ArrayList<MedicinalShop_CART>();
		// 声明结果集
		ResultSet rs = null;
		// 获取连接对象
		Connection conn = BaseDao.getconn();
		PreparedStatement pst = null;
		try {
			String sql = "";
				sql = "select * from cart where USER_ID=?";
				pst = conn.prepareStatement(sql);
				pst.setString(1, userid);
				rs = pst.executeQuery();
				while (rs.next()) {
					MedicinalShop_CART c;
					c = new MedicinalShop_CART(rs.getString("USER_ID"), rs.getString("PHOTO"),
							rs.getString("PRODUCT_ID"), rs.getString("NAME"), rs.getString("PRICE"),
							rs.getString("NUM"), rs.getString("TOTAL"));
					list.add(c);
				}
				
			}catch(SQLException e){
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				BaseDao.closeall(rs, pst, conn);
			}
		return list;
	}
	public static int del(String uid,String proid) {
		String sql = "delete from cart where USER_ID=? and PRODUCT_ID=?";
		Object[] params = { uid,proid };
		return BaseDao.exectulUD(sql, params);
	}
	public static int insert(MedicinalShop_CART c) {
		String sql = "insert into cart values(?,?,?,?,?,?,?)";
		Object[] params = { c.getUSER_ID(),c.getPHOTO(),c.getPRODUCT_ID(),
				c.getNAME(),c.getPRICE(),c.getNUM(),c.getTOTAL()};
		return BaseDao.exectulUD(sql, params);
	}
}

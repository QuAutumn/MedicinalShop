package com.medicinalshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.medicinalshop.entity.MedicinalShop_ORDER;

public class OrderDao {
	public static int insert(MedicinalShop_ORDER o) {
		String sql = "insert into userorder values(?,?,?,?,?,?,?,?,?,?)";
		Object[] params = { o.getUSER_ID(),o.getUSER_NAME(),o.getORDER_ID(),
				o.getPHOTO(),o.getPRODUCT_ID(),o.getPRODUCT_NAME(),o.getNUM(),
				o.getTOTALPRICE(),o.getADDRESS(),o.getPHONE()};
		return BaseDao.exectulUD(sql, params);
	}
	public static ArrayList<MedicinalShop_ORDER> selectByID(String uid) {
		ArrayList<MedicinalShop_ORDER> list = new ArrayList<MedicinalShop_ORDER>();
		MedicinalShop_ORDER o = null;
		// 声明结果集
		ResultSet rs = null;
		// 获取连接对象
		Connection conn = BaseDao.getconn();
		PreparedStatement pst = null;
		try {
			String sql = "";
			sql = "select * from userorder where USER_ID=?";
			pst = conn.prepareStatement(sql);
			pst.setString(1,uid);
			rs = pst.executeQuery();
			while (rs.next()) {
				//MedicinalShop_ORDER o;
				o = new MedicinalShop_ORDER(rs.getString("USER_ID"), rs.getString("USER_NAME"),
						rs.getString("ORDER_ID"), rs.getString("PHOTO"), rs.getString("PRODUCT_ID"),
						rs.getString("PRODUCT_NAME"),rs.getString("NUM"),rs.getString("TOTALPRICE"),
						rs.getString("ADDRESS"),rs.getString("PHONE"));
				list.add(o);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			BaseDao.closeall(rs, pst, conn);
		}
		return list;
	}
	public static ArrayList<MedicinalShop_ORDER> selectall() {
		ArrayList<MedicinalShop_ORDER> list = new ArrayList<MedicinalShop_ORDER>();
		MedicinalShop_ORDER o = null;
		// 声明结果集
		ResultSet rs = null;
		// 获取连接对象
		Connection conn = BaseDao.getconn();
		PreparedStatement pst = null;
		try {
			String sql = "";
			sql = "select * from userorder";
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				//MedicinalShop_ORDER o;
				o = new MedicinalShop_ORDER(rs.getString("USER_ID"), rs.getString("USER_NAME"),
						rs.getString("ORDER_ID"), rs.getString("PHOTO"), rs.getString("PRODUCT_ID"),
						rs.getString("PRODUCT_NAME"),rs.getString("NUM"),rs.getString("TOTALPRICE"),
						rs.getString("ADDRESS"),rs.getString("PHONE"));
				list.add(o);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			BaseDao.closeall(rs, pst, conn);
		}
		return list;
	}
}

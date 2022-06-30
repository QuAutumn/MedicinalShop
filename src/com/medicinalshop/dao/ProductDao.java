package com.medicinalshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.medicinalshop.entity.MedicinalShop_PRODUCT;

public class ProductDao {
	public static ArrayList<MedicinalShop_PRODUCT> selectAll(int cpage, int count, String keyword) {
		ArrayList<MedicinalShop_PRODUCT> list = new ArrayList<MedicinalShop_PRODUCT>();
		// 声明结果集
		ResultSet rs = null;
		// 获取连接对象
		Connection conn = BaseDao.getconn();
		PreparedStatement pst = null;
		try {
			String sql = "";
			if (keyword != null) {
				sql = "select * from product where PRODUCT_NAME like ? limit ?,?";
				// 限制每一页展示成果，保证每一页显示的是不同数据
				pst = conn.prepareStatement(sql);
				pst.setString(1, "%" + keyword + "%");
				pst.setInt(2, cpage);
				pst.setInt(3, count);
			} else {
				sql = "select * from product  limit ?,?";
				pst = conn.prepareStatement(sql);
				pst.setInt(1, cpage);
				pst.setInt(2, count);
			}
			rs = pst.executeQuery();
			while (rs.next()) {
				MedicinalShop_PRODUCT p;
				p = new MedicinalShop_PRODUCT(rs.getString("PRODUCT_ID"), rs.getString("PRODUCT_NAME"),
						rs.getString("PRODUCT_PHOTO"), rs.getInt("PRODUCT_PRICE"), rs.getInt("PRODUCT_NUM"),
						rs.getString("PRODUCT_PID"));
				list.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			BaseDao.closeall(rs, pst, conn);
		}
		return list;
	}
	public int counts(String proname) {
		int count = 0;
		// 声明结果集
		ResultSet rs = null;
		// 获取连接对象
		Connection conn = BaseDao.getconn();
		PreparedStatement pst = null;
		try {
			String sql = "";
			if (proname != null) {
				sql = "select count(*) as total from product where PRODUCT_NAME like ?";
				pst = conn.prepareStatement(sql);
				pst.setString(1, "%" + proname + "%");
			} else {
				sql = "select count(*) as total from product";
				pst = conn.prepareStatement(sql);
			}
			rs = pst.executeQuery();
			while (rs.next()) {
				count = rs.getInt("total");
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			BaseDao.closeall(rs, pst, conn);
		}
		return count;
	}
	public static ArrayList<MedicinalShop_PRODUCT> selectByID(String proid) {
		ArrayList<MedicinalShop_PRODUCT> list = new ArrayList<MedicinalShop_PRODUCT>();
		MedicinalShop_PRODUCT p = null;
		// 声明结果集
		ResultSet rs = null;
		// 获取连接对象
		Connection conn = BaseDao.getconn();
		PreparedStatement pst = null;
		try {
			String sql = "";
			sql = "select * from product where PRODUCT_ID=?";
			pst = conn.prepareStatement(sql);
			pst.setString(1,proid);
			rs = pst.executeQuery();
			while (rs.next()) {
				//MedicinalShop_PRODUCT u;
				p = new MedicinalShop_PRODUCT(rs.getString("PRODUCT_ID"), rs.getString("PRODUCT_NAME"),
						rs.getString("PRODUCT_PHOTO"), rs.getInt("PRODUCT_PRICE"), rs.getInt("PRODUCT_NUM"),
						rs.getString("PRODUCT_PID"));
				list.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			BaseDao.closeall(rs, pst, conn);
		}
		return list;
	}
	
	public static ArrayList<MedicinalShop_PRODUCT> selectByNAME(String proname) {
		ArrayList<MedicinalShop_PRODUCT> list = new ArrayList<MedicinalShop_PRODUCT>();
		MedicinalShop_PRODUCT p = null;
		// 声明结果集
		ResultSet rs = null;
		// 获取连接对象
		Connection conn = BaseDao.getconn();
		PreparedStatement pst = null;
		try {
			String sql = "";
			sql = "select * from product where PRODUCT_NAME like?";
			pst = conn.prepareStatement(sql);
			pst.setString(1,"%"+proname+"%");
			rs = pst.executeQuery();
			while (rs.next()) {
				//MedicinalShop_PRODUCT u;
				p = new MedicinalShop_PRODUCT(rs.getString("PRODUCT_ID"), rs.getString("PRODUCT_NAME"),
						rs.getString("PRODUCT_PHOTO"), rs.getInt("PRODUCT_PRICE"), rs.getInt("PRODUCT_NUM"),
						rs.getString("PRODUCT_PID"));
				list.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			BaseDao.closeall(rs, pst, conn);
		}
		return list;
	}
	public static ArrayList<MedicinalShop_PRODUCT> selectProduct() {
		ArrayList<MedicinalShop_PRODUCT> list = new ArrayList<MedicinalShop_PRODUCT>();
		MedicinalShop_PRODUCT p = null;
		// 声明结果集
		ResultSet rs = null;
		// 获取连接对象
		Connection conn = BaseDao.getconn();
		PreparedStatement pst = null;
		try {
			String sql = "";
			sql = "select * from product";
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				//MedicinalShop_PRODUCT u;
				p = new MedicinalShop_PRODUCT(rs.getString("PRODUCT_ID"), rs.getString("PRODUCT_NAME"),
						rs.getString("PRODUCT_PHOTO"), rs.getInt("PRODUCT_PRICE"), rs.getInt("PRODUCT_NUM"),
						rs.getString("PRODUCT_PID"));
				list.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			BaseDao.closeall(rs, pst, conn);
		}
		return list;
	}
	public static int check(String proid) {
		int count = 0;
		// 声明结果集
		ResultSet rs = null;
		// 获取连接对象
		Connection conn = BaseDao.getconn();
		PreparedStatement pst = null;
		try {
			String sql = "";
			sql = "select * from product where PRODUCT_ID=?";
			pst = conn.prepareStatement(sql);
			pst.setString(1,proid);
			rs = pst.executeQuery();
			if(rs.next()) {
				count = 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			BaseDao.closeall(rs, pst, conn);
		}
		return count;
	}
	public static int insert(MedicinalShop_PRODUCT p) {
		//PRODUCT_ID=?,PRODUCT_NAME=?,PRODUCT_PHOTO=?,PRODUCT_PRICE=?,PRODUCT_NUM=?,PRODUCT_PID=?
		String sql = "insert into product values(?,?,?,?,?,?)";
		Object[] params = { p.getPRODUCT_ID(), p.getPRODUCT_NAME(), p.getPRODUCT_PHOTO(), 
				p.getPRODUCT_PRICE(),p.getPRODUCT_NUM(), p.getPRODUCT_PID()};
		return BaseDao.exectulUD(sql, params);
	}
	public static int del(String proid) {
		String sql = "delete from product where PRODUCT_ID=?";
		Object[] params = { proid };
		return BaseDao.exectulUD(sql, params);
	}
	public static int update(MedicinalShop_PRODUCT p) {
		String sql = "update product set PRODUCT_NAME=?,PRODUCT_PHOTO=?,PRODUCT_PRICE=?,PRODUCT_NUM=?,PRODUCT_PID=? where PRODUCT_ID=?";
		Object[] params = {  p.getPRODUCT_NAME(), p.getPRODUCT_PHOTO(), p.getPRODUCT_PRICE(),
				p.getPRODUCT_NUM(), p.getPRODUCT_PID(),p.getPRODUCT_ID() };
		return BaseDao.exectulUD(sql, params);
	}
	public static ArrayList<MedicinalShop_PRODUCT> selectBYpropid(int cpage, int count,String propid) {
		ArrayList<MedicinalShop_PRODUCT> list = new ArrayList<MedicinalShop_PRODUCT>();
		MedicinalShop_PRODUCT p = null;
		// 声明结果集
		ResultSet rs = null;
		// 获取连接对象
		Connection conn = BaseDao.getconn();
		PreparedStatement pst = null;
		try {
			String sql = "";
			sql = "select * from product where PRODUCT_PID=? limit ?,?";
			pst = conn.prepareStatement(sql);
			pst.setString(1,propid);
			pst.setInt(2, cpage);
			pst.setInt(3, count);
			rs = pst.executeQuery();
			while (rs.next()) {
				//MedicinalShop_PRODUCT u;
				p = new MedicinalShop_PRODUCT(rs.getString("PRODUCT_ID"), rs.getString("PRODUCT_NAME"),
						rs.getString("PRODUCT_PHOTO"), rs.getInt("PRODUCT_PRICE"), rs.getInt("PRODUCT_NUM"),
						rs.getString("PRODUCT_PID"));
				list.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			BaseDao.closeall(rs, pst, conn);
		}
		return list;
	}
	public int count(String propid) {
		int count = 0;
		// 声明结果集
		ResultSet rs = null;
		// 获取连接对象
		Connection conn = BaseDao.getconn();
		PreparedStatement pst = null;
		try {
			String sql = "";
			sql = "select count(*) as total from product where PRODUCT_PID like ?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, "%"+propid+"%");
			rs = pst.executeQuery();
			while (rs.next()) {
				count = rs.getInt("total");
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			BaseDao.closeall(rs, pst, conn);
		}
		return count;
	}
}

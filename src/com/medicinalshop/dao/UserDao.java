package com.medicinalshop.dao;

import java.util.*;

import com.medicinalshop.entity.MedicinalShop_USER;

import java.sql.*;

public class UserDao {
	public static ArrayList<MedicinalShop_USER> selectAll(int cpage, int count, String keyword) {
		ArrayList<MedicinalShop_USER> list = new ArrayList<MedicinalShop_USER>();
		// 声明结果集
		ResultSet rs = null;
		// 获取连接对象
		Connection conn = BaseDao.getconn();
		PreparedStatement pst = null;
		try {
			String sql = "";
			if (keyword != null) {
				sql = "select * from user where USER_NAME like ? and USER_STATUS=? limit ?,?";
				// 限制每一页展示成果，保证每一页显示的是不同数据
				pst = conn.prepareStatement(sql);
				pst.setString(1, "%" + keyword + "%");
				pst.setString(2, "2");
				pst.setInt(3, cpage);
				pst.setInt(4, count);
			} else {
				sql = "select * from user where USER_STATUS=? limit ?,?";
				pst = conn.prepareStatement(sql);
				pst.setString(1, "2");
				pst.setInt(2, cpage);
				pst.setInt(3, count);
			}
			rs = pst.executeQuery();
			while (rs.next()) {
				MedicinalShop_USER u;
				u = new MedicinalShop_USER(rs.getString("USER_ID"), rs.getString("USER_NAME"),
						rs.getString("USER_PASSWORD"), rs.getString("USER_SEX"), rs.getString("USER_BIRTHDAY"),
						rs.getString("USER_PHONE"), rs.getString("USER_ADDRESS"), rs.getInt("USER_STATUS"));
				list.add(u);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			BaseDao.closeall(rs, pst, conn);
		}
		return list;
	}

	public int counts(String keyword) {
		int count = 0;
		// 声明结果集
		ResultSet rs = null;
		// 获取连接对象
		Connection conn = BaseDao.getconn();
		PreparedStatement pst = null;
		try {
			String sql = "";
			if (keyword != null) {
				sql = "select count(*) as total from user where USER_NAME like ? and USER_STATUS=?";
				pst = conn.prepareStatement(sql);
				pst.setString(1, "%" + keyword + "%");
				pst.setString(2, "2");
			} else {
				sql = "select count(*) as total from user where USER_STATUS=?";
				pst = conn.prepareStatement(sql);
				pst.setString(1, "2");
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

	public static int del(String id) {
		String sql = "delete from user where USER_ID=?";
		Object[] params = { id };
		return BaseDao.exectulUD(sql, params);
	}

	public static MedicinalShop_USER selectByID(String id) {
		// ArrayList<MedicinalShop_USER> list = new ArrayList<MedicinalShop_USER>();
		MedicinalShop_USER u = null;
		// 声明结果集
		ResultSet rs = null;
		// 获取连接对象
		Connection conn = BaseDao.getconn();
		PreparedStatement pst = null;
		try {
			String sql = "";
			sql = "select * from user where USER_ID=?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);
			rs = pst.executeQuery();
			while (rs.next()) {
				u = new MedicinalShop_USER(rs.getString("USER_ID"), rs.getString("USER_NAME"),
						rs.getString("USER_PASSWORD"), rs.getString("USER_SEX"), rs.getString("USER_BIRTHDAY"),
						rs.getString("USER_PHONE"), rs.getString("USER_ADDRESS"), rs.getInt("USER_STATUS"));
				// list.add(u);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			BaseDao.closeall(rs, pst, conn);
		}
		return u;
	}

	public static int update(MedicinalShop_USER u) {
		String sql = "update user set USER_NAME=?,USER_PASSWORD=?,USER_SEX=?,USER_BIRTHDAY=?,USER_PHONE=?,USER_ADDRESS=? where USER_ID=?";
		Object[] params = { u.getUSER_NAME(), u.getUSER_PASSWORD(), u.getUSER_SEX(), u.getUSER_BIRTHDAY(),
				u.getUSER_PHONE(), u.getUSER_ADDRESS(), u.getUSER_ID() };
		return BaseDao.exectulUD(sql, params);
	}
	
	public static int insert(MedicinalShop_USER u) {
		String sql = "insert into user values(?,?,?,?,?,?,?,?)";
		Object[] params = { u.getUSER_ID(), u.getUSER_NAME(), u.getUSER_PASSWORD(), 
				u.getUSER_SEX(),u.getUSER_BIRTHDAY(), u.getUSER_PHONE(),
				u.getUSER_ADDRESS(),u.getUSER_STATUS()};
		return BaseDao.exectulUD(sql, params);
	}
}

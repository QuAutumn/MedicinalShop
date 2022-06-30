package com.medicinalshop.dao;

import java.sql.*;
import java.util.*;
public class BaseDao {
	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//声明为静态方法防止出错
	public static Connection getconn() {
		//创建一个连接对象
		Connection conn = null;
		try {
			String url = "jdbc:mysql://localhost:3306/medicinalshop?useUnicode=true&characterEncoding=UTF-8";
			String user = "root";
			String password = "root";
			conn = DriverManager.getConnection(url,user,password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	//增删改查
	public static int exectulUD(String sql,Object[] params) {
		int count = 0;
		Connection  conn = BaseDao.getconn();
		PreparedStatement ps = null;
		
		try {
			//准备sql
			ps = conn.prepareStatement(sql);
			for(int i=0;i<params.length;i++) {
				ps.setObject(i+1, params[i]);
			}
			count = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			BaseDao.closeall(null,ps,conn);
		}
		return count;
	}
	public static void closeall(ResultSet rs,PreparedStatement ps,Connection conn) {
		try {
			if(rs!=null)
				rs.close();
			if(ps!=null)
				ps.close();
			if(conn!=null)
				conn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
}

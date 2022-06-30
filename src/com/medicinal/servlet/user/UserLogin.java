package com.medicinal.servlet.user;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.medicinalshop.dao.*;
import com.medicinalshop.entity.MedicinalShop_USER;
/**
 * Servlet implementation class AdminLogin
 */
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		//out.print(session.getAttribute("isLogin"));
		String flag = String.valueOf(session.getAttribute("isLogin"));
		//String uid = String.valueOf(session.getAttribute("uname"));
		//out.print(uid);
		if(flag.equals("1"))
			response.sendRedirect("Login_MANAGER.jsp");
		else
			response.sendRedirect("Login_USER.jsp");
		//doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String userId = request.getParameter("userid");
		String userPwd = request.getParameter("userpwd");
		String code = request.getParameter("code");
		String randStr = (String)session.getAttribute("randStr");
		MedicinalShop_USER u = null;
		ResultSet rs = null;
		Connection conn = BaseDao.getconn();
		PreparedStatement ps = null;
		try {
			String sql = "select * from user where USER_ID=? and USER_PASSWORD=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, userId);
			ps.setString(2, userPwd);
			rs = ps.executeQuery();
			while(rs.next()) {
				u = new MedicinalShop_USER(
						rs.getString("USER_ID"),
						rs.getString("USER_NAME"),
						rs.getString("USER_PASSWORD"),
						rs.getString("USER_SEX"),
						rs.getString("USER_BIRTHDAY"),
						rs.getString("USER_PHONE"),
						rs.getString("USER_ADDRESS"),
						rs.getInt("USER_STATUS")
						);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			BaseDao.closeall(rs, ps, conn);
		}
		if(u==null) {
			out.print("<script>");
			out.print("alert('’À∫≈ªÚ√‹¬Î¥ÌŒÛ£°');");
			out.print("location.href='Login.jsp'");
			out.print("</script>");
			out.close();
			return;
		}
		else if(!code.equals(randStr)) {
			out.print("<script>");
			out.print("alert('—È÷§¬Î¥ÌŒÛ£°');");
			out.print("location.href='Login.jsp'");
			out.print("</script>");
			out.close();
			return;
		}
		else {
			String uname = u.getUSER_NAME();
			session.setAttribute("uid", u.getUSER_ID());
			session.setAttribute("uname", uname);
			session.setAttribute("uphone", u.getUSER_PHONE());
			session.setAttribute("uaddress", u.getUSER_ADDRESS());
			if(u.getUSER_STATUS()==1) {
				session.setAttribute("isManager", u.getUSER_STATUS());
				session.removeAttribute("isUser");
			}
			else {
				session.setAttribute("isUser", u.getUSER_STATUS());
				session.setAttribute("isManager", u);
			}
			//out.print(session.getAttribute("isLogin"));
			/*if(u.getUSER_STATUS()==1) 
				response.sendRedirect("Login_MANAGER.jsp");
			else
				response.sendRedirect("Login_USER.jsp");*/
			response.sendRedirect("ProductSearchServlet?proname="+"");
		}
	}

}

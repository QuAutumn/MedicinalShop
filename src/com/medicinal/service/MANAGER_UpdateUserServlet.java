package com.medicinal.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.medicinalshop.dao.BaseDao;
import com.medicinalshop.dao.UserDao;
import com.medicinalshop.entity.MedicinalShop_USER;

/**
 * Servlet implementation class MANAGER_UpdateUserServlet
 */
public class MANAGER_UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MANAGER_UpdateUserServlet() {
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
		String sid1 = request.getParameter("id");
		String p = request.getParameter("page");
		out.print(sid1+"+"+p);
		//ArrayList<MedicinalShop_USER> list = new ArrayList<MedicinalShop_USER>();
		UserDao bs = new UserDao();
		MedicinalShop_USER u1 = bs.selectByID(sid1);
		session.setAttribute("u1", u1);
		response.sendRedirect("Login_MANAGER_UpdateUser.jsp");
		//out.print(u1.getUSER_NAME());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		MedicinalShop_USER id = (MedicinalShop_USER)session.getAttribute("u1");
		//out.print(id.getUSER_ID());
		MedicinalShop_USER u2 = new MedicinalShop_USER(id.getUSER_ID(),
				request.getParameter("n"),
				request.getParameter("p1"),
				request.getParameter("s"),
				request.getParameter("b"),
				request.getParameter("p2"),
				request.getParameter("a"),2);
		//out.print(u2.getUSER_NAME()+u2.getUSER_PASSWORD()+u2.getUSER_BIRTHDAY()+u2.getUSER_PHONE());
		int count = UserDao.update(u2);
		String p3 = request.getParameter("page");
		if(count>0) {
			response.sendRedirect("MANAGER_SearchUserServlet?page="+p3);
		}
		else {
			out.write("<script>");
			out.write("alert('ÐÞ¸ÄÊ§°Ü')");
			out.write("location.href='Login_MANAGER_UpdateUser.jsp'");
			out.write("</script>");
		}
	}

}

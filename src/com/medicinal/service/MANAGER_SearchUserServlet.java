package com.medicinal.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.medicinalshop.dao.UserDao;
import com.medicinalshop.entity.MedicinalShop_USER;

/**
 * Servlet implementation class MANAGER_SearchUserServlet
 */
public class MANAGER_SearchUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MANAGER_SearchUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
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
		session.setAttribute("user", request.getParameter("user"));
		//out.print(session.getAttribute("user"));
		session.setAttribute("keyword", request.getParameter("username"));
		String keyword = (String)session.getAttribute("keyword");
		String p = request.getParameter("page");
		int page;
		//out.print(session.getAttribute(keyword));
		UserDao us = new UserDao();
		try {
			//当前页数
			page = Integer.valueOf(p);
		}catch(NumberFormatException e){
			page = 1;
		}
		out.print(page);
		//用户总数
		int totalUsers = us.counts(keyword);
		//每页用户数
		int usersPages = 8;
		//总页数
		int totalPages = totalUsers % usersPages == 0?totalUsers/usersPages:totalUsers/usersPages+1;
		//本页起始用户序号
		int beginIndex = (page-1)*usersPages;
		//out.print(keyword);
		//ArrayList<MedicinalShop_USER> list = new ArrayList<MedicinalShop_USER>();
		//MedicinalShop_USER u;
		
		session.setAttribute("user", us.selectAll(beginIndex, usersPages,keyword));
		session.setAttribute("totalUsers",totalUsers);
		session.setAttribute("totalPages", totalPages);
		session.setAttribute("page", page);
		//out.print(u.getUSER_NAME());
		//request.getRequestDispatcher("Login_MANAGER_MANAGE.jsp").forward(request, response);
		response.sendRedirect("Login_MANAGER_MANAGE.jsp");
	}

}

package com.medicinal.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.medicinalshop.dao.UserDao;
import com.medicinalshop.entity.MedicinalShop_USER;

/**
 * Servlet implementation class USER_PersonalDataUpdate
 */
public class USER_PersonalDataUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public USER_PersonalDataUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String uname = request.getParameter("uname");
		String upwd = request.getParameter("upwd");
		String usex = request.getParameter("usex");
		String ubirth = request.getParameter("ubirth");
		String uphone = request.getParameter("uphone");
		String uaddress = request.getParameter("uaddress");
		String uid = request.getParameter("uid");
		MedicinalShop_USER u = new MedicinalShop_USER(uid,uname,upwd,usex,
				ubirth,uphone,uaddress,2);
		int count = UserDao.update(u);
		if(count>0) {
			response.sendRedirect("USER_PersonalData");
		}
		else {
			out.write("<script>");
			out.write("alert('信息填写有误，无法更改！')");
			out.write("location.href='SearchCartByUID'");
			out.write("</script>");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

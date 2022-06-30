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

import com.medicinalshop.dao.ProductDao;
import com.medicinalshop.entity.MedicinalShop_PRODUCT;

/**
 * Servlet implementation class MANAGER_UpdateProductServlet
 */
public class MANAGER_UpdateProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MANAGER_UpdateProductServlet() {
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
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		String proid = request.getParameter("pid");
		ArrayList<MedicinalShop_PRODUCT> list = ProductDao.selectByID(proid);
		session.setAttribute("p2", list.get(0));
		response.sendRedirect("Login_MANAGER_UpdateProduct.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		//HttpSession session = request.getSession();
		//out.print(request.getParameter("proid")+request.getParameter("proname"));
		MedicinalShop_PRODUCT p = new MedicinalShop_PRODUCT(
						request.getParameter("proid"),
						request.getParameter("proname"),
						request.getParameter("prophoto"),
						Integer.valueOf(request.getParameter("proprice")),
						Integer.valueOf(request.getParameter("pronum")),
						request.getParameter("propid"));
		int count = ProductDao.update(p);
		if(count>0)
			response.sendRedirect("MANAGER_ProductServlet");
		else {
			out.write("<script>");
			out.write("alert('商品信息修改失败')");
			out.write("location.href='Login_MANAGER_UpdateProduct.jsp'");
			out.write("</script>");
		}
	}
}

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
 * Servlet implementation class ProductSearchServlet
 */
public class MANAGER_ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MANAGER_ProductServlet() {
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
		PrintWriter out = response.getWriter();
		session.setAttribute("proname", request.getParameter("proname"));
		String proname = (String)session.getAttribute("proname");
		String p = request.getParameter("page");
		int page;
		try {
			//当前页数
			page = Integer.valueOf(p);
		}catch(NumberFormatException e){
			page = 1;
		}
		ProductDao pd = new ProductDao();
		//商品总数
		int totalProduct2 = pd.counts(proname);
		//每页商品数
		int productPages2 = 2;
		//总页数
		int totalPages2 = totalProduct2 % productPages2 == 0?totalProduct2/productPages2:totalProduct2/productPages2+1;
		//本页起始商品序号
		int beginIndex = (page-1)*productPages2;
		session.setAttribute("product", pd.selectAll(beginIndex, productPages2,proname));
		session.setAttribute("totalProduct2",totalProduct2);
		session.setAttribute("totalPages2", totalPages2);
		session.setAttribute("page2", page);
		response.sendRedirect("MANAGER_Product.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		//PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String proname = request.getParameter("proname");
		ArrayList<MedicinalShop_PRODUCT> list = ProductDao.selectByNAME(proname);
		session.setAttribute("plist", list);
		response.sendRedirect("");
	}

}

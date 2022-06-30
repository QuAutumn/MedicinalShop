package com.medicinal.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.medicinalshop.dao.ProductDao;
import com.medicinalshop.entity.MedicinalShop_PRODUCT;

/**
 * Servlet implementation class MANAGER_AddProductServlet
 */
public class MANAGER_AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MANAGER_AddProductServlet() {
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
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String proid = request.getParameter("proid");
		int count = ProductDao.check(proid);
		//out.print(proid+count);
		if(count<=0) {
			out.print("该商品ID可以使用！");
		}
		else {
			out.print("该商品ID已经存在!");
		}
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
		MedicinalShop_PRODUCT pro = new MedicinalShop_PRODUCT(
				request.getParameter("proid"),
				request.getParameter("proname"),
				request.getParameter("prophoto"),
				Integer.parseInt( request.getParameter("proprice")),
				Integer.parseInt( request.getParameter("pronum")),
				request.getParameter("propid"));
		int count = ProductDao.insert(pro);
		if(count>0) {
			response.sendRedirect("MANAGER_ProductServlet");
		}
		else{
			out.write("<script>");
			out.write("alert('商品添加失败！')");
			out.write("location.href='MANAGER_ProductServlet'");
			out.write("</script>");
		}
		/*out.print(request.getParameter("proid")+
		request.getParameter("proname")+
		request.getParameter("prophoto")+
		 request.getParameter("proprice")+
		request.getParameter("pronum")+
		request.getParameter("propid"));*/
	}

}

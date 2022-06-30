package com.medicinal.servlet.user;

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
 * Servlet implementation class SearchProduct_PID
 */
public class SearchProduct_PID extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchProduct_PID() {
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
		PrintWriter out = response.getWriter();
		String propid = request.getParameter("propid");
		//out.print(propid);
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
		int totalProduct1 = pd.count(propid);
		//每页商品数
		int productPages1 = 5;
		//总页数
		int totalPages1 = totalProduct1 % productPages1 == 0?totalProduct1/productPages1:totalProduct1/productPages1+1;
		//本页起始商品序号
		int beginIndex = (page-1)*productPages1;
		HttpSession session = request.getSession();
		ArrayList<MedicinalShop_PRODUCT> list = ProductDao.selectBYpropid(beginIndex,productPages1,propid);
		if(list!=null&&list.size()>0) {
			session.setAttribute("propid", ProductDao.selectBYpropid(beginIndex,productPages1,propid));
			session.setAttribute("totalProduct1",totalProduct1);
			session.setAttribute("totalPages1", totalPages1);
			session.setAttribute("page1", page);
			String managerflag = String.valueOf(session.getAttribute("isManager"));
			String userflag = String.valueOf(session.getAttribute("isUser"));
			if(managerflag.equals("1"))
				response.sendRedirect("MANAGER_SearchByPropid.jsp");
			if(userflag.equals("2"))
				response.sendRedirect("User_SearchByPropid.jsp");
		}
		else {
			out.print("<script>");
			out.print("alert('暂无该类商品！');");
			out.print("location.href='ProductSearchServlet'");
			out.print("</script>");
			out.close();
			return;
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

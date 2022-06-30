package com.medicinal.servlet.cart;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.medicinalshop.dao.CartDao;
import com.medicinalshop.entity.MedicinalShop_CART;
import com.medicinalshop.entity.MedicinalShop_PRODUCT;

/**
 * Servlet implementation class UserAddProductCart
 */
public class UserAddProductCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserAddProductCart() {
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
		HttpSession session = request.getSession();
		String uid = (String)session.getAttribute("uid");
		MedicinalShop_PRODUCT p = (MedicinalShop_PRODUCT)session.getAttribute("viewpro");
		//out.print(uid+p.getPRODUCT_ID()+p.getPRODUCT_NAME()+p.getPRODUCT_NUM());
		int totalnum = Integer.parseInt(request.getParameter("pronum"));
		String totalprice = String.valueOf(p.getPRODUCT_PRICE()*totalnum);
		//out.print(totalprice);
		MedicinalShop_CART userc = new MedicinalShop_CART(uid,p.getPRODUCT_PHOTO(),
				p.getPRODUCT_ID(),p.getPRODUCT_NAME(),String.valueOf(p.getPRODUCT_PRICE()),
				request.getParameter("pronum"),totalprice);
		int count = CartDao.insert(userc);
		if(count>0) {
			out.print("<script>");
			out.print("alert('已加入购物车！');");
			out.print("location.href='ProductViewServlet?proid="+p.getPRODUCT_ID()+"'");
			out.print("</script>");
			out.close();
			return;
		}
		else {
			out.print("<script>");
			out.print("alert('购物车已有该商品！');");
			out.print("location.href='ProductViewServlet?proid="+p.getPRODUCT_ID()+"'");
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

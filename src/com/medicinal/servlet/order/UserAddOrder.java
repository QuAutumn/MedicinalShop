package com.medicinal.servlet.order;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.medicinalshop.dao.OrderDao;
import com.medicinalshop.entity.MedicinalShop_ORDER;
import com.medicinalshop.entity.MedicinalShop_PRODUCT;

/**
 * Servlet implementation class UserAddOrder
 */
public class UserAddOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserAddOrder() {
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
		MedicinalShop_PRODUCT p = (MedicinalShop_PRODUCT)session.getAttribute("viewpro");
		String orderid = (String)session.getAttribute("order");
		String uid = (String)session.getAttribute("uid");
		String uname = (String)session.getAttribute("uname");
		String uphone = (String)session.getAttribute("uphone");
		String uaddress = (String)session.getAttribute("uaddress");
		String pronum = (String)session.getAttribute("pnum");
		String totalprice = String.valueOf(p.getPRODUCT_PRICE()*Integer.parseInt(pronum));
		//out.print(totalprice);
		MedicinalShop_ORDER o1 = new MedicinalShop_ORDER(uid,uname,orderid,
				p.getPRODUCT_PHOTO(),p.getPRODUCT_ID(),p.getPRODUCT_NAME(),
				pronum,totalprice,uaddress,uphone);
		//out.print(o1.getUSER_ID()+o1.getUSER_NAME()+o1.getORDER_ID()+o1.getPRODUCT_ID()+o1.getPRODUCT_NAME());
		int count = OrderDao.insert(o1);
		if(count>0) {
			out.print("<script>");
			out.print("alert('付款成功！');");
			out.print("location.href='ProductViewServlet?proid="+p.getPRODUCT_ID()+"'");
			out.print("</script>");
			out.close();
			return;
		}
		else {
			out.print("<script>");
			out.print("alert('付款失败！');");
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

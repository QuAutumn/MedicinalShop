package com.medicinal.servlet.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.medicinalshop.dao.UserDao;
import com.medicinalshop.entity.MedicinalShop_USER;

/**
 * Servlet implementation class UserRegisterServlet
 */
public class UserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserRegisterServlet() {
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
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
		String userid = request.getParameter("userid");
		String userpwd = request.getParameter("userpwd");
		String username = request.getParameter("username");
		String usersex = request.getParameter("sex");
		String date = request.getParameter("birthYear")+"-"+request.getParameter("birthMonth")+"-"+request.getParameter("birthDay");
		//out.print(date);
		String code = request.getParameter("code");
		String randStr = (String)session.getAttribute("randStr");
		MedicinalShop_USER u = UserDao.selectByID(userid);
		
		if(!code.equals(randStr)) {
			out.print("<script>");
			out.print("alert('验证码错误！');");
			out.print("location.href='Register.jsp'");
			out.print("</script>");
			out.close();
			return;
		}
		else {
			if(u==null) {
				MedicinalShop_USER u1 = new MedicinalShop_USER(userid,username,
						userpwd,usersex,date,"","",2);
				//out.print(u1.getUSER_ID()+u1.getUSER_NAME()+u1.getUSER_PASSWORD()+u1.getUSER_SEX()+u1.getUSER_PHONE()+u1.getUSER_STATUS());
				int count = UserDao.insert(u1);
				if(count>0) {
					out.print("<script>");
					out.print("alert('注册成功！');");
					out.print("location.href='Login.jsp'");
					out.print("</script>");
					out.close();
					return;
				}
				else {
					out.print("<script>");
					out.print("alert('注册失败！');");
					out.print("location.href='Register.jsp'");
					out.print("</script>");
					out.close();
					return;
				}
			}
			else{
				out.print("<script>");
				out.print("alert('该用户名已经存在，请重新填写信息！');");
				out.print("location.href='Register.jsp'");
				out.print("</script>");
				out.close();
				return;
			}
		}
	}

}

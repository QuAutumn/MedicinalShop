package com.medicinalshop.filter;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class AdminLogin
 */
public class AdminLogin implements Filter {
    /**
     * Default constructor. 
     */
    public AdminLogin() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here

		// pass the request along the filter chain
		HttpServletRequest req=(HttpServletRequest)request;
		HttpServletResponse resp=(HttpServletResponse)response;
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = req.getSession();
		String managerflag = String.valueOf(session.getAttribute("isManager"));
		/*String request_url = req.getRequestURI();
		String ctxPath = req.getContextPath();
		String url = request_url.substring(ctxPath.length());
		System.out.print(request_url+"**"+ctxPath+"**"+url);**/
		
		/*List<String> list= new ArrayList<String>(); //������Ҫ���˵������ŵ�������
		list.add("/FirstPage.html");//�ο�ҳ��
		list.add("/login.jsp");//��¼ҳ��
		list.add("/Register.jsp");//ע��ҳ��
		String path = req.getServletPath();//�õ������url
		//ѭ�����ϰѲ���Ҫ���˵��������
		for(String l : list){
			if(path.endsWith(l)){
				chain.doFilter(request, response);
				return;
				}
			}*/
		
		if(managerflag!=null&&managerflag.equals("1")) {
			chain.doFilter(req, resp);
		}
		else {
			PrintWriter out = resp.getWriter();
			out.print("<script>");
			out.print("alert('���ȵ�¼��');");
			out.print("location.href='Login.jsp'");
			out.print("</script>");
			out.close();
			return;
		}
		/*System.out.print(session.getAttribute("isLogin"));
		chain.doFilter(req, resp);*/
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}

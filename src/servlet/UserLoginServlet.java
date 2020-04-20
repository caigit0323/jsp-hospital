package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.SelectBean;

public class UserLoginServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UserLoginServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		String status = request.getParameter("status");
		
		String sql = "select * from users where name='"+name+"' and pwd='"+pwd+"'";
		if(status != null && status.equals("管理员")){
			sql = "select * from admin where name='"+name+"' and pwd='"+pwd+"'";
		}
		String args[] = {"id","name","pwd","status"};
		SelectBean sb = new SelectBean();		
		ArrayList al = sb.select(args, sql);
		String str = "";
		
		if(al == null || al.size() == 0){
			str = "/index.jsp";
			request.setAttribute("message", "用户名或密码错误！");
		}else{
			if(status != null && status.equals("挂号人员")){
				str = "/users/register.jsp";
			}
			if(status != null && status.equals("医护")){
				str = "/users/cases.jsp";
			}
			if(status != null && status.equals("药品库")){
				str = "/users/charge.jsp";
			}
			if(status != null && status.equals("管理员")){
				str = "/admin/index.jsp";
			}
			HttpSession session = request.getSession();
			session.setAttribute("userlogin", al);
		}
		
		request.getRequestDispatcher(str).forward(request, response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occure
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}

package servlet;


import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.InsertUpdateDelBean;
import bean.SelectBean;

/**
 * Servlet implementation class UserzhuServlet
 */
@WebServlet("/UserzhuServlet")
public class UserzhuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserzhuServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=GBK");
		request.setCharacterEncoding("GBK");
		
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		String status = request.getParameter("status");
		System.out.println(status);
		String sql = "insert into users(name,pwd,status) values('"+name+"','"+pwd+"','"+status+"')";
		String args[] = {"id","name","pwd","status"};
		SelectBean sb = new SelectBean();		
		ArrayList al = sb.select(args, sql);
		InsertUpdateDelBean ib = new InsertUpdateDelBean();
		ib.insertANDupdateANDdel(sql);
		request.setAttribute("message","×¢²á³É¹¦£¡");
		
		request.getRequestDispatcher("zhuce.jsp").forward(request, response);
	}

}

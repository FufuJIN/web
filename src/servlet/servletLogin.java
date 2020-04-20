package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import dao.UserDaoImpl;
import show.bean.Data;

/**
 * Servlet implementation class servletLogin
 */
//@WebServlet("/servletLogin")
public class servletLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public servletLogin() {
        super();
        // TODO Auto-generated constructor stub
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
		System.out.println("Login Test");
		UserDao isUser = new UserDaoImpl();
		String user = request.getParameter("name");
		String pass = request.getParameter("pwd");
		//String path = request.getContextPath();
		HttpSession session=request.getSession();
		if(isUser.login(user, pass)==true) {
			session.setAttribute("uname", user);
//			RequestDispatcher view = request.getRequestDispatcher("Vdata.jsp");
//			view.forward(request, response);
			response.sendRedirect("learn.jsp");
		}else {
			response.sendRedirect("index.jsp");
		}
		
	}

}

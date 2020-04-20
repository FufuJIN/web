package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DataDao;
import dao.DataDaoImpl;
import dao.UserDao;
import dao.UserDaoImpl;
import net.sf.json.JSONArray;
import show.bean.DataEchats;

import java.util.*;
import java.text.*;

/**
 * Servlet implementation class servletSelectByDate
 */
//@WebServlet("/servletSelectByDate")
public class servletSelectByDate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public servletSelectByDate() {
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
		System.out.println("SelectByDate");
		response.setContentType("text/xml;charset=utf-8");
		String beginday = request.getParameter("start");
		String overday = request.getParameter("end");
		System.out.println("begin :"+beginday);
		System.out.println("end :"+overday);
		if(beginday == null) {
			System.out.println("null");
		}
		else if(overday == null) {
			
		}
		else {
			Date dateBegin = null;
			Date dateOver = null;
			try {
				dateBegin = new SimpleDateFormat("yyyy-MM-dd").parse(beginday);
				dateOver = new SimpleDateFormat("yyyy-MM-dd").parse(overday);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			long numBegin =dateBegin.getTime();
			long numOver  =dateOver.getTime();
			System.out.println(numBegin);
			System.out.println(numOver);
			DataDao dataByDate = new DataDaoImpl();
			String name =(String)request.getSession().getAttribute("uname");
			ArrayList<DataEchats> array = dataByDate.getDataEchatsByDate(name,numBegin,numOver);
			
			JSONArray json=JSONArray.fromObject(array);
			System.out.println(json.toString());
		    PrintWriter out = response.getWriter();  
		    out.println(json);  
		    out.flush();  
		    out.close();
		}
	}

}

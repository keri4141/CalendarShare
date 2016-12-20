package aot.CalendarWeb.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DaoMVC;

/**
 * Servlet implementation class ShareServlet
 */
@WebServlet("/ShareServlet")
public class ShareServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id_user =request.getParameter("id_user");  //id_user in shared table
		HttpSession session=request.getSession(); 
		// USER WHO IS SHARING CALENDAR WITH SOMEONE id_usershared in shared table
		String current_user=(String) session.getAttribute("idUsers"); 
		
		String sql="insert into Shared(id_user,id_usershared) values(?,?)";
		DaoMVC.Share(sql,id_user,current_user);
		getServletContext().getRequestDispatcher("/index.jsp").forward(request,response);
	}

}

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
 * Servlet implementation class AddEvent
 */
@WebServlet("/AddEvent")
public class AddEvent extends HttpServlet {
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
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String title = request.getParameter("title");
		HttpSession session=request.getSession(); 
		String userID = (String) session.getAttribute("idUsers");
		String sql = "INSERT INTO Calendar (title,start,end,id_user) VALUE(?,?,?,?)";
		
		DaoMVC.UpdateCalendar(sql,title,start,end,userID);
	}

}

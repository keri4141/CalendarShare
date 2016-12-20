package aot.CalendarWeb.servlets;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DaoMVC;
import model.ModelMVC;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		//get all parameters from JSP page
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		if(username.equals(null)||username==""||password.equals(null)||password=="")
		{
			request.setAttribute("msg","All Fields are mandatory");
			getServletContext().getRequestDispatcher("/login.jsp").forward(request,response);
			
		}
		//if input is not blank
		else
		{
			ModelMVC m= new ModelMVC();
			m.setUsername(username);
			m.setPassword(password);
			
			String sql="select * from USERS where username=? and password=?";
			HttpSession session=request.getSession(); 
			ResultSet rs=DaoMVC.loginUser(m,sql);
			
			try {
				if(rs.next())
				{
					   
				        session.setAttribute("idUsers",rs.getString(1));  
					getServletContext().getRequestDispatcher("/index.jsp").forward(request,response);
				
				}
				else
				{
					getServletContext().getRequestDispatcher("/login.jsp").forward(request,response);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		}
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws IOException, ServletException
	        {
	       
	        }

}

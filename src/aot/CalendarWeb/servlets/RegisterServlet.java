package aot.CalendarWeb.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoMVC;
import model.ModelMVC;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		String username =request.getParameter("username");
		String password =request.getParameter("password");
		String repassword =request.getParameter("repassword");
		
		//set all values to model object
		ModelMVC m = new ModelMVC();
		
		m.setUsername(username);
		m.setPassword(password);
	
		//check if username exists in database
		String sqlUserNameCheck="SELECT * from USERS WHERE username=?";
		boolean userExistance=DaoMVC.usernameCheck(sqlUserNameCheck,username);
		
		//user doesnt exist yet
		if(userExistance==false)
		{
		
		
			//call a method to insert data to table
			String sql="insert into USERS(username,password) values(?,?)";
			int i = DaoMVC.registerUser(m,sql);
			
			if(i!=0)
			{
				System.out.println("value inserted");
				request.setAttribute("msg","Registration successful, Login Here");
				getServletContext().getRequestDispatcher("/login.jsp").forward(request,response);
			}
			
			else
			{
				System.out.println("Value not inserted");
			}
		}
		//username exists already
		else
		{
			request.setAttribute("msg","Username Taken Please choose a different one");
			getServletContext().getRequestDispatcher("/register.jsp").forward(request,response);
		}
	}
	

}

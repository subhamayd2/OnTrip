package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Client;
import dao.DataAccessObject;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

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
		PrintWriter out = response.getWriter();
		String u_id = request.getParameter("u_id");
		String upass = request.getParameter("upass");
		String rem = request.getParameter("remember");
		Client c = new Client();
		c.setU_id(u_id);
		c.setUpass(upass);
		DataAccessObject dao = new DataAccessObject();
		Client user = dao.readClient(c);
		if(user.getU_id() != null)
		{
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			if(rem.equals("true"))
			{
				Cookie ck = new Cookie("u_id", user.getU_id());
				ck.setPath("/");
				ck.setMaxAge(99999999);
				response.addCookie(ck);
			}
			
			System.out.println(user.getU_id());
			out.println("1");
		}
		else
			out.println("0");
	}

}

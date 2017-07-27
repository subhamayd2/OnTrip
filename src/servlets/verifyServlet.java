package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Client;
import dao.DataAccessObject;

/**
 * Servlet implementation class verifyServlet
 */
@WebServlet("/verifyServlet")
public class verifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public verifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String u_id = request.getParameter("u_id");
		String uhash = request.getParameter("uhash");
		Client c = new Client();
		c.setU_id(u_id);
		c.setUhash(uhash);
		DataAccessObject dao = new DataAccessObject();
		if(dao.verifyClient(c))
			out.println("Account activated!");
		else
			out.println("Invalid account!");
	}

}

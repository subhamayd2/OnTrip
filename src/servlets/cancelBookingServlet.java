package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DataAccessObject;

/**
 * Servlet implementation class cancelBookingServlet
 */
@WebServlet("/cancelBookingServlet")
public class cancelBookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cancelBookingServlet() {
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
		PrintWriter out = response.getWriter();
		String u_id = request.getParameter("u_id");
		String t_type = request.getParameter("t_type");
		String t_time = request.getParameter("t_time");
		String t_book_for = request.getParameter("t_book_for");
		System.out.println(u_id+" "+t_type+" "+t_time+" "+t_book_for+" a");
		DataAccessObject dao = new DataAccessObject();
		if(dao.cancelBooking(u_id,t_type,t_time,t_book_for))
		{
			System.out.println("true");
			out.println("1");
		}
		else
		{
			System.out.println("false");
			out.println("0");
		}
	}

}

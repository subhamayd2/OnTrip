package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.bookBean;
import dao.DataAccessObject;

/**
 * Servlet implementation class trainBookServlet
 */
@WebServlet("/trainBookServlet")
public class trainBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public trainBookServlet() {
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
		String t_number = request.getParameter("t_number");
		String t_book_on = request.getParameter("t_book_on");
		String t_passenger = request.getParameter("t_passenger");
		String t_class = request.getParameter("t_class");
		String t_amount = request.getParameter("t_amount");
		String t_time = request.getParameter("t_time");
		String t_book_for = request.getParameter("t_book_for");
		String t_from = request.getParameter("t_from");
		String t_to = request.getParameter("t_to");
		String t_type = "train";
		String t_status = "CONFIRMED";
		bookBean b = new bookBean();
		b.setU_id(u_id);
		b.setT_type(t_type);
		b.setT_number(t_number);
		b.setT_book_on(t_book_on);
		b.setT_passenger(t_passenger);
		b.setT_class(t_class);
		b.setT_amount(t_amount);
		b.setT_status(t_status);
		b.setT_time(t_time);
		b.setT_book_for(t_book_for);
		b.setT_from(t_from);
		b.setT_to(t_to);
		DataAccessObject dao = new DataAccessObject();
		if(dao.insertBook(b))
		{
			out.println("1");
		}
		else
			out.println("0");
	}

}
















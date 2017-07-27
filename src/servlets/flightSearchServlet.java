package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import bean.flightBean;
import dao.DataAccessObject;

/**
 * Servlet implementation class flightSearchServlet
 */
@WebServlet("/flightSearchServlet")
public class flightSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public flightSearchServlet() {
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
		String flight_from = request.getParameter("flight_from");
		String flight_to = request.getParameter("flight_to");
		String flight_depart = request.getParameter("flight_depart");
		String flight_arrive = request.getParameter("flight_arrive");
		flightBean fb = new flightBean();
		fb.setFlight_from(flight_from);
		fb.setFlight_to(flight_to);
		fb.setFlight_depart(flight_depart);
		fb.setFlight_arrive(flight_arrive);
		DataAccessObject dao = new DataAccessObject();
		ArrayList<flightBean> result = null;
		result = dao.getFlightDetails(fb);
		Gson gson = new Gson();
		String messages = gson.toJson(result);
		out.println("{\"Messages\":"+messages+"}");
	}

}

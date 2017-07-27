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

import bean.busBean;
import dao.DataAccessObject;

/**
 * Servlet implementation class busSearchServlet
 */
@WebServlet("/busSearchServlet")
public class busSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public busSearchServlet() {
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
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String bus_from = request.getParameter("bus_from");
		String bus_to = request.getParameter("bus_to");
		String bus_depart = request.getParameter("bus_depart");
		String bus_arrive = request.getParameter("bus_arrive");
		busBean bb = new busBean();
		bb.setBus_from(bus_from);
		bb.setBus_to(bus_to);
		bb.setBus_depart(bus_depart);
		bb.setBus_arrive(bus_arrive);
		DataAccessObject dao = new DataAccessObject();
		ArrayList<busBean> result = null;
		result = dao.getBusDetails(bb);
		Gson gson = new Gson();
		String messages = gson.toJson(result);
		out.println("{\"Messages\":"+messages+"}");
	}

}






























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

import bean.trainBean;
import dao.DataAccessObject;

/**
 * Servlet implementation class trainSearchServlet
 */
@WebServlet("/trainSearchServlet")
public class trainSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public trainSearchServlet() {
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
		String train_from = request.getParameter("train_from");
		String train_to = request.getParameter("train_to");
		String train_depart = request.getParameter("train_depart");
		String train_arrive = request.getParameter("train_arrive");
		trainBean tb = new trainBean();
		tb.setTrain_from(train_from);
		tb.setTrain_to(train_to);
		tb.setTrain_depart(train_depart);
		tb.setTrain_arrive(train_arrive);
		DataAccessObject dao = new DataAccessObject();
		ArrayList<trainBean> result = null;
		result = dao.getTrainDetails(tb);
		Gson gson = new Gson();
		String messages = gson.toJson(result);
		out.println("{\"Messages\":"+messages+"}");
	}

}

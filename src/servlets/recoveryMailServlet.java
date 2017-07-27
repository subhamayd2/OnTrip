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
import mail.Mail;

/**
 * Servlet implementation class recoveryMailServlet
 */
@WebServlet("/recoveryMailServlet")
public class recoveryMailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public recoveryMailServlet() {
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
		String uname = request.getParameter("uname");
		Client c = new Client();
		DataAccessObject dao = new DataAccessObject();
		c.setU_id(u_id);
		c.setUname(uname);
		if(!dao.chkRecoveryUid(c))
		{
			out.println("0");
		}
		else
		{
			Mail m = new Mail();
			if(m.sendRecoveryMail(u_id, uname))
				out.println("1");
		}
	}

}















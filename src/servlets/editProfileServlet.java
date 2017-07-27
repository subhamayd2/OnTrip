package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import bean.Client;
import dao.DataAccessObject;

/**
 * Servlet implementation class editProfileServlet
 */
@WebServlet("/editProfileServlet")
@MultipartConfig(location="C:\\Users\\Subhamay\\workspace\\OnTrip\\WebContent\\profile",fileSizeThreshold=5*1024*1024, maxFileSize=10*1024*1024, maxRequestSize=15*1024*1024)
public class editProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editProfileServlet() {
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
		String uphone = request.getParameter("uphone");
		String uaddress = request.getParameter("uaddress");
		Part p = request.getPart("uimage");
		
		Client c = new Client();
		c.setU_id(u_id);
		c.setUname(uname);
		c.setUphone(uphone);
		c.setUaddress(uaddress);
		String uimage = "C:\\Users\\Subhamay\\workspace\\OnTrip\\WebContent\\profile\\"+u_id+".jpg";
		c.setUimage(uimage);
		if(p != null)
		{
			p.write(uimage);
		}
		
		DataAccessObject dao = new DataAccessObject();
		Client user = dao.updateClient(c);
		if(user.getU_id() != null)
		{
			HttpSession session = request.getSession(true);
			session.setAttribute("user", user);
			out.println("1");
		}
		else
			out.println("0");
	}

}












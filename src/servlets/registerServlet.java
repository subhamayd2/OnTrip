package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import bean.Client;
import dao.DataAccessObject;
import mail.Mail;

/**
 * Servlet implementation class registerServlet
 */
@WebServlet("/registerServlet")
@MultipartConfig(location="C:\\Users\\Subhamay\\workspace\\OnTrip\\WebContent\\profile",fileSizeThreshold=5*1024*1024, maxFileSize=10*1024*1024, maxRequestSize=15*1024*1024)
public class registerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String u_id = request.getParameter("u_id");
		String upass = request.getParameter("upass");
		String uname = request.getParameter("uname");
		String uaddress = request.getParameter("uaddress");
		String uphone = request.getParameter("uphone");
		int random = 1000 + (int)(Math.random() * ((9999 - 1000) + 1));
		String uhash = ""+random;
		uhash = ""+uhash.hashCode();
		uhash = uhash+uhash.hashCode()+uhash.hashCode()+uhash.hashCode();
		String uimage = "C:\\Users\\Subhamay\\workspace\\OnTrip\\WebContent\\profile\\"+u_id+".jpg";
		Part p = request.getPart("uimage");
		p.write(uimage);
		Client c = new Client();
		DataAccessObject dao = new DataAccessObject();
		c.setU_id(u_id);
		c.setUaddress(uaddress);
		c.setUimage(uimage);
		c.setUname(uname);
		c.setUpass(upass);
		c.setUphone(uphone);
		c.setUactive("0");
		c.setUhash(uhash);
		if(dao.insertClient(c))
		{
			Mail m = new Mail();
			m.sendMail(u_id, uname, uhash);
		}
	}

}

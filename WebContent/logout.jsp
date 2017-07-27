<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% 
    session.invalidate();
    Cookie[] cks = request.getCookies();
    Cookie ck = null;
	if(cks != null)
	{
		for(int j = 0;j < cks.length; j++)
		{
			if(cks[j].getName().equals("u_id"))
			{
				ck = cks[j];
				ck.setValue(null);
				ck.setMaxAge(0);
				ck.setPath("/");
				response.addCookie(ck);
			}
		}
	}
    	response.sendRedirect("home.jsp");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
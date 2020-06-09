<%-- 
    Document   : logoutsession
    Created on : Jun 9, 2020, 2:11:15 AM
    Author     : 11141
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
             request.getSession().setAttribute("username", null);
            response.sendRedirect("index.html");
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
            response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
            response.setDateHeader("Expires", 0);
         %>
     </body>
</html>

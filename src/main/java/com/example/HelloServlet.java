package com.example;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class HelloServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.getWriter().println("<h1>Hello from HelloServlet!</h1>");
    }
}

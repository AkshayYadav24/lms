package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.User;

@WebServlet("/admin_dashboard.do")
public class AdminDashboardServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String nextPage = "login.do?role_id=1";
        HttpSession session = request.getSession();

        User user =(User)session.getAttribute("user");

        if(user != null) {
            nextPage = "admin_dashboard.jsp";
        }
        request.getRequestDispatcher(nextPage).forward(request, response);
    }  

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doGet(request, response);
    }   
}

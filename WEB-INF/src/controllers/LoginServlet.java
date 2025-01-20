package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.User;
import models.UserType;

@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        Integer userTypeId = Integer.parseInt(request.getParameter("user_type_id"));
        Integer userId = Integer.parseInt(request.getParameter("user_id"));
        String password = request.getParameter("password");

        String nextPage = "login.jsp";

        User user = new User(userId, password, new UserType(userTypeId));
        int result = user.login();

        if (result == 2) {
            session.setAttribute("user", user);
            if (user.getUserType().getUserTypeId() == 1) {
                nextPage = "admin_dashboard.do";
            } else {
                nextPage = "user_dashboard.do";
            }
        }
        request.getRequestDispatcher(nextPage).forward(request, response);
    }
}

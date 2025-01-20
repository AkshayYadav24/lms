package controllers;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;

import javax.management.relation.Role;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.User;
import models.UserType;


@WebServlet("/signup.do")
public class SignUpServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("signup.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        Integer userTypeId = Integer.parseInt(request.getParameter("user_type_id"));
        String nextPage = "signup.do?user_type_id=" + userTypeId;

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String contact = request.getParameter("contact");


        User user = new User(name, email, password, contact,new UserType(userTypeId));

        int result = user.saveUser();

        if (result != 0) {
            nextPage = "sucess.jsp?user_id="+  result;
        }

        response.sendRedirect(nextPage);
    }
}

package com.littlestar.controler;

import com.littlestar.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/me")
public class MeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType(
                "application/json;charset=UTF-8"
        );

        response.setCharacterEncoding("UTF-8");

        HttpSession session =
                request.getSession(false);

        User user =
                session != null
                        ? (User) session.getAttribute("user")
                        : null;

        if (user == null) {

            response.getWriter().write(
                    "{\"loggedIn\":false}"
            );

            return;
        }

        String name = escapeJson(user.getName());
        String email = escapeJson(user.getEmail());

        response.getWriter().write(
                "{\"loggedIn\":true,"
                + "\"name\":\"" + name + "\","
                + "\"email\":\"" + email + "\"}"
        );
    }

    private String escapeJson(String value) {

        if (value == null) {
            return "";
        }

        return value
                .replace("\\", "\\\\")
                .replace("\"", "\\\"");
    }
}
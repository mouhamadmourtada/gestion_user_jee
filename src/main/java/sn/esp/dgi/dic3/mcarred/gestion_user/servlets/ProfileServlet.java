package sn.esp.dgi.dic3.mcarred.gestion_user.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sn.esp.dgi.dic3.mcarred.gestion_user.beans.Utilisateur;

import java.io.IOException;

@WebServlet("/profil")
public class ProfileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("utilisateur") != null) {
            Utilisateur utilisateur = (Utilisateur) session.getAttribute("utilisateur");
            request.setAttribute("utilisateur", utilisateur);
            request.getRequestDispatcher("/WEB-INF/profil.jsp").forward(request, response);
        } else {
            response.sendRedirect("login");
        }
    }
}
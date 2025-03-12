package sn.esp.dgi.dic3.mcarred.gestion_user.servlets;

// import jakarta.servlet.ServletException;
// import jakarta.servlet.annotation.WebServlet;
// import jakarta.servlet.http.HttpServlet;
// import jakarta.servlet.http.HttpServletRequest;
// import jakarta.servlet.http.HttpServletResponse;
// import jakarta.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sn.esp.dgi.dic3.mcarred.gestion_user.beans.Utilisateur;
import sn.esp.dgi.dic3.mcarred.gestion_user.dao.UtilisateurDao;

import java.io.IOException;

@WebServlet(name = "AuthServlet", value = {"/login", "/logout"})
public class AuthServlet extends HttpServlet {
    private UtilisateurDao utilisateurDao;

    public void init() {
        utilisateurDao = new UtilisateurDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();
        if ("/logout".equals(action)) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }
        
        // Si l'utilisateur est déjà connecté, redirigez-le vers l'accueil
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("utilisateur") != null) {
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }
        
        request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String login = request.getParameter("login");
        String password = request.getParameter("password");
        String errorMessage = null;

        if (login == null || login.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            errorMessage = "Veuillez remplir tous les champs";
        } else {
            Utilisateur utilisateur = utilisateurDao.authentifier(login, password);
            if (utilisateur != null) {
                HttpSession session = request.getSession();
                session.setAttribute("utilisateur", utilisateur);
                response.sendRedirect(request.getContextPath() + "/");
                return;
            } else {
                errorMessage = "Login ou mot de passe incorrect";
            }
        }

        request.setAttribute("errorMessage", errorMessage);
        request.setAttribute("login", login);
        request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
    }
}
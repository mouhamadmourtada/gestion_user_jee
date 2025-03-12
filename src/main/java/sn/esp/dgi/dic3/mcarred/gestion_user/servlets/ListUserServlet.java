package sn.esp.dgi.dic3.mcarred.gestion_user.servlets;

import sn.esp.dgi.dic3.mcarred.gestion_user.dao.UtilisateurDao;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "listUserServlet", value = "/list")
public class ListUserServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        // Gestion du message de succès
        if (session.getAttribute("successMessage") != null) {
            request.setAttribute("successMessage", session.getAttribute("successMessage"));
            session.removeAttribute("successMessage");
        }
        
        // Gestion du message d'erreur
        if (session.getAttribute("errorMessage") != null) {
            request.setAttribute("errorMessage", session.getAttribute("errorMessage"));
            session.removeAttribute("errorMessage");
        }
        
        request.setAttribute("utilisateurs", UtilisateurDao.lister());
        getServletContext().getRequestDispatcher("/WEB-INF/list.jsp").forward(request, response);
    }
}
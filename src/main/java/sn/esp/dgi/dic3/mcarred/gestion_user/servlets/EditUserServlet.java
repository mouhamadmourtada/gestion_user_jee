package sn.esp.dgi.dic3.mcarred.gestion_user.servlets;

import sn.esp.dgi.dic3.mcarred.gestion_user.beans.Utilisateur;
import sn.esp.dgi.dic3.mcarred.gestion_user.dao.UtilisateurDao;
import sn.esp.dgi.dic3.mcarred.gestion_user.forms.UtilisateurForm;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "editUserServlet", value = "/edit")
public class EditUserServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        if (id != null && !id.isEmpty() && id.matches("\\d+")) {
            Utilisateur utilisateur = UtilisateurDao.find(Integer.parseInt(id));
            if (utilisateur != null) {
                utilisateur.setPassword("");
                request.setAttribute("utilisateur", utilisateur);
                getServletContext().getRequestDispatcher("/WEB-INF/edit.jsp").forward(request, response);
                return;
            }
        }
        
        HttpSession session = request.getSession();
        session.setAttribute("errorMessage", "Utilisateur introuvable.");
        response.sendRedirect("list");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UtilisateurForm form = new UtilisateurForm(request);
        
        if (form.modifier()) {
            HttpSession session = request.getSession();
            session.setAttribute("successMessage", "L'utilisateur " + form.getUtilisateur().getPrenom() + " " + form.getUtilisateur().getNom() + " a été modifié avec succès!");
            response.sendRedirect("list");
        } else {
            request.setAttribute("form", form);
            request.setAttribute("utilisateur", form.getUtilisateur());
            request.setAttribute("errorMessage", form.getStatusMessage());
            getServletContext().getRequestDispatcher("/WEB-INF/edit.jsp").forward(request, response);
        }
    }
}
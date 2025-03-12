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

@WebServlet(name = "deleteUserServlet", value = "/delete")
public class DeleteUserServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String id = request.getParameter("id");
        
        if (id != null && !id.isEmpty()) {
            Utilisateur utilisateur = UtilisateurDao.find(Integer.parseInt(id));
            if (utilisateur != null) {
                String userName = utilisateur.getPrenom() + " " + utilisateur.getNom();
                if (UtilisateurForm.supprimer(request)) {
                    session.setAttribute("successMessage", "L'utilisateur " + userName + " a été supprimé avec succès!");
                } else {
                    session.setAttribute("errorMessage", "Erreur lors de la suppression de l'utilisateur " + userName);
                }
            } else {
                session.setAttribute("errorMessage", "Utilisateur introuvable");
            }
        } else {
            session.setAttribute("errorMessage", "ID utilisateur invalide");
        }
        
        response.sendRedirect("list");
    }
}
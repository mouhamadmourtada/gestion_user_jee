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
        if (id != null && !id.isEmpty()) {
            Utilisateur utilisateur = UtilisateurDao.find(Integer.parseInt(id));
            request.setAttribute("utilisateur", utilisateur);
        }
        getServletContext().getRequestDispatcher("/WEB-INF/edit.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UtilisateurForm form = new UtilisateurForm();
        Utilisateur utilisateur = form.validateUser(request);
        String id = request.getParameter("id");
        if (id != null && !id.isEmpty()) {
            utilisateur.setId(Integer.parseInt(id));
        }
        
        request.setAttribute("form", form);
        request.setAttribute("utilisateur", utilisateur);

        if (form.getErreurs().isEmpty()) {
            UtilisateurDao.modifyUser(utilisateur);
            HttpSession session = request.getSession();
            session.setAttribute("successMessage", "L'utilisateur " + utilisateur.getPrenom() + " " + utilisateur.getNom() + " a été modifié avec succès!");
            response.sendRedirect("list");
        } else {
            request.setAttribute("errorMessage", "Erreur lors de la modification. Veuillez vérifier les champs.");
            getServletContext().getRequestDispatcher("/WEB-INF/edit.jsp").forward(request, response);
        }
    }
}
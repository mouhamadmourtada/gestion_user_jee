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

@WebServlet(name = "addUserServlet", value = "/add")
public class AddUserServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/WEB-INF/add.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UtilisateurForm form = new UtilisateurForm();
        Utilisateur utilisateur = form.validateUser(request);
        
        request.setAttribute("form", form);
        request.setAttribute("utilisateur", utilisateur);

        if (form.getErreurs().isEmpty()) {
            UtilisateurDao.ajouter(utilisateur);
            HttpSession session = request.getSession();
            session.setAttribute("successMessage", "L'utilisateur " + utilisateur.getPrenom() + " " + utilisateur.getNom() + " a été ajouté avec succès!");
            response.sendRedirect("list");
        } else {
            request.setAttribute("errorMessage", "Erreur lors de l'ajout de l'utilisateur. Veuillez vérifier les champs.");
            getServletContext().getRequestDispatcher("/WEB-INF/add.jsp").forward(request, response);
        }
    }
}
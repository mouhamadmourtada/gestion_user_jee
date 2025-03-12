package sn.esp.dgi.dic3.mcarred.gestion_user.servlets;

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
        UtilisateurForm form = new UtilisateurForm(request);
        
        if (form.ajouter()) {
            HttpSession session = request.getSession();
            session.setAttribute("successMessage", "L'utilisateur " + form.getUtilisateur().getPrenom() + " " + form.getUtilisateur().getNom() + " a été ajouté avec succès!");
            response.sendRedirect("list");
        } else {
            request.setAttribute("form", form);
            request.setAttribute("utilisateur", form.getUtilisateur());
            request.setAttribute("errorMessage", form.getStatusMessage());
            getServletContext().getRequestDispatcher("/WEB-INF/add.jsp").forward(request, response);
        }
    }
}
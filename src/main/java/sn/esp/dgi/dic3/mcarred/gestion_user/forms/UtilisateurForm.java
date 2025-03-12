package sn.esp.dgi.dic3.mcarred.gestion_user.forms;

import sn.esp.dgi.dic3.mcarred.gestion_user.beans.Utilisateur;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

public class UtilisateurForm {
    private Map<String, String> erreurs = new HashMap<>();
    private String resultat;

    public Utilisateur validateUser(HttpServletRequest request) {
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String login = request.getParameter("login");
        String password = request.getParameter("password");

        Utilisateur utilisateur = new Utilisateur();

        validateChamp(nom, "nom");
        validateChamp(prenom, "prenom");
        validateChamp(login, "login");
        validateChamp(password, "password");

        utilisateur.setNom(nom);
        utilisateur.setPrenom(prenom);
        utilisateur.setLogin(login);
        utilisateur.setPassword(password);

        if (erreurs.isEmpty()) {
            resultat = "Succès de l'opération";
        } else {
            resultat = "Échec de l'opération";
        }

        return utilisateur;
    }

    private void validateChamp(String valeur, String champ) {
        if (valeur == null || valeur.trim().length() == 0) {
            erreurs.put(champ, "Le champ " + champ + " est obligatoire");
        }
    }

    public Map<String, String> getErreurs() {
        return erreurs;
    }

    public String getResultat() {
        return resultat;
    }
}
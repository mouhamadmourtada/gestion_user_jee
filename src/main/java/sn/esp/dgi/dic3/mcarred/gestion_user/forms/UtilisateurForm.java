package sn.esp.dgi.dic3.mcarred.gestion_user.forms;

import sn.esp.dgi.dic3.mcarred.gestion_user.beans.Utilisateur;
import sn.esp.dgi.dic3.mcarred.gestion_user.dao.UtilisateurDao;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

public class UtilisateurForm {
    private static final String CHAMP_ID = "id";
    private static final String CHAMP_NOM = "nom";
    private static final String CHAMP_PRENOM = "prenom";
    private static final String CHAMP_LOGIN = "login";
    private static final String CHAMP_PASSWORD = "password";
    private static final String CHAMP_PASSWORD_BIS = "passwordBis";

    private static final String ADD_SUCCESS_MESSAGE = "Ajout réussi";
    private static final String ADD_FAILURE_MESSAGE = "Ajout échoué";
    private static final String UPDATE_SUCCESS_MESSAGE = "Mise à jour réussie";
    private static final String UPDATE_FAILURE_MESSAGE = "Mise à jour échouée";

    private Map<String, String> erreurs;
    private String resultat;
    private HttpServletRequest request;
    private boolean status;
    private Utilisateur utilisateur;
    private String statusMessage;

    public UtilisateurForm(HttpServletRequest request) {
        this.request = request;
        this.erreurs = new HashMap<>();
        this.status = false;
        this.statusMessage = "";
        
        String id = getParameter(CHAMP_ID);
        if (id != null && id.matches("\\d+")) {
            this.utilisateur = UtilisateurDao.find(Integer.parseInt(id));
        }
        if (this.utilisateur == null) {
            this.utilisateur = new Utilisateur();
        }
    }

    public boolean ajouter() {
        this.utilisateur = new Utilisateur();
        
        this.utilisateur.setPrenom(getParameter(CHAMP_PRENOM));
        this.utilisateur.setNom(getParameter(CHAMP_NOM));
        this.utilisateur.setLogin(getParameter(CHAMP_LOGIN));
        this.utilisateur.setPassword(getParameter(CHAMP_PASSWORD));

        validerChamps(CHAMP_NOM, CHAMP_PRENOM, CHAMP_LOGIN, CHAMP_PASSWORD, CHAMP_PASSWORD_BIS);
        validerPasswords(getParameter(CHAMP_PASSWORD), getParameter(CHAMP_PASSWORD_BIS));

        if (erreurs.isEmpty()) {
            status = UtilisateurDao.ajouter(utilisateur);
            statusMessage = status ? ADD_SUCCESS_MESSAGE : ADD_FAILURE_MESSAGE;
        }

        return status;
    }

    public boolean modifier() {
        String idStr = getParameter(CHAMP_ID);
        System.out.println("Tentative de modification de l'utilisateur avec ID: " + idStr);

        if (idStr == null || !idStr.matches("\\d+")) {
            erreurs.put(CHAMP_ID, "ID utilisateur invalide");
            statusMessage = UPDATE_FAILURE_MESSAGE;
            return false;
        }

        int id = Integer.parseInt(idStr);
        this.utilisateur = UtilisateurDao.find(id);

        if (this.utilisateur == null) {
            erreurs.put(CHAMP_ID, "Utilisateur non trouvé");
            statusMessage = UPDATE_FAILURE_MESSAGE;
            return false;
        }

        this.utilisateur.setPrenom(getParameter(CHAMP_PRENOM));
        this.utilisateur.setNom(getParameter(CHAMP_NOM));
        this.utilisateur.setLogin(getParameter(CHAMP_LOGIN));
        this.utilisateur.setPassword(getParameter(CHAMP_PASSWORD));

        validerChamps(CHAMP_NOM, CHAMP_PRENOM, CHAMP_LOGIN, CHAMP_PASSWORD);
        
        if (getParameter(CHAMP_PASSWORD_BIS) != null) {
            validerPasswords(getParameter(CHAMP_PASSWORD), getParameter(CHAMP_PASSWORD_BIS));
        }

        if (erreurs.isEmpty()) {
            status = UtilisateurDao.modifyUser(utilisateur);
            statusMessage = status ? UPDATE_SUCCESS_MESSAGE : UPDATE_FAILURE_MESSAGE;
        }

        return status;
    }

    public Utilisateur validateUser(HttpServletRequest request) {
        String nom = getParameter(CHAMP_NOM);
        String prenom = getParameter(CHAMP_PRENOM);
        String login = getParameter(CHAMP_LOGIN);
        String password = getParameter(CHAMP_PASSWORD);
        String passwordBis = getParameter(CHAMP_PASSWORD_BIS);

        validerChamps(CHAMP_NOM, CHAMP_PRENOM, CHAMP_LOGIN, CHAMP_PASSWORD);
        if (passwordBis != null) {
            validerPasswords(password, passwordBis);
        }

        if (!erreurs.isEmpty()) {
            resultat = "Échec de l'opération";
            status = false;
        } else {
            utilisateur.setNom(nom);
            utilisateur.setPrenom(prenom);
            utilisateur.setLogin(login);
            utilisateur.setPassword(password);
            resultat = "Succès de l'opération";
            status = true;
        }

        return utilisateur;
    }

    public static boolean supprimer(HttpServletRequest request) {
        String id = request.getParameter(CHAMP_ID);
        if (id != null && id.matches("\\d+")) {
            return UtilisateurDao.delUser(Integer.parseInt(id));
        }
        return false;
    }

    private void validerChamps(String... champs) {
        for (String champ : champs) {
            String valeur = getParameter(champ);
            if (valeur == null || valeur.trim().isEmpty()) {
                erreurs.put(champ, "Vous devez renseigner ce champ");
            }
        }
    }

    private void validerPasswords(String password, String passwordBis) {
        if (password != null && !password.equals(passwordBis)) {
            String errorMessage = "Les mots de passe ne correspondent pas";
            erreurs.put(CHAMP_PASSWORD, errorMessage);
            erreurs.put(CHAMP_PASSWORD_BIS, errorMessage);
        }
    }

    private String getParameter(String parametre) {
        String valeur = request.getParameter(parametre);
        return valeur == null || valeur.trim().isEmpty() ? null : valeur.trim();
    }

    public Map<String, String> getErreurs() {
        return erreurs;
    }

    public String getResultat() {
        return resultat;
    }

    public boolean isStatus() {
        return status;
    }

    public Utilisateur getUtilisateur() {
        return utilisateur;
    }

    public String getStatusMessage() {
        return statusMessage;
    }
}
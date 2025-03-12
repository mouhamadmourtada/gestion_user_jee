package sn.esp.dgi.dic3.mcarred.gestion_user.dao;

import sn.esp.dgi.dic3.mcarred.gestion_user.beans.Utilisateur;
import java.util.ArrayList;

public class UtilisateurDao {
    private static int lastId = 1;
    private static final ArrayList<Utilisateur> utilisateurs = new ArrayList<>();

    static {
        utilisateurs.add(new Utilisateur(lastId++, "DIOP", "Modou", "modou", "passer"));
        utilisateurs.add(new Utilisateur(lastId++, "FALL", "Fatou", "fatou", "passer123"));
    }

    public static boolean ajouter(Utilisateur utilisateur) {
        utilisateur.setId(lastId++);
        utilisateurs.add(utilisateur);
        return true;
    }

    public static ArrayList<Utilisateur> lister() {
        return utilisateurs;
    }

    public static void modifyUser(Utilisateur user) {
        for (Utilisateur utilisateur : utilisateurs) {
            if(utilisateur.getId() == user.getId()) {
                utilisateur.setNom(user.getNom());
                utilisateur.setPrenom(user.getPrenom());
                utilisateur.setLogin(user.getLogin());
                utilisateur.setPassword(user.getPassword());
            }
        }
    }

    public static boolean delUser(int userId) {
        utilisateurs.removeIf(utilisateur -> utilisateur.getId() == userId);
        return true;
    }

    public static Utilisateur find(int id) {
        for (Utilisateur utilisateur : utilisateurs) {
            if(utilisateur.getId() == id)
                return utilisateur;
        }
        return new Utilisateur();
    }
}
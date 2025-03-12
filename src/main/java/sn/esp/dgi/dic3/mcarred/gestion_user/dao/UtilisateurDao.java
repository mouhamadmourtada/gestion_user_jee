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
        try {
            utilisateur.setId(lastId++);
            utilisateurs.add(utilisateur);
            return true;
        } catch (Exception e) {
            System.err.println("Erreur lors de l'ajout de l'utilisateur : " + e.getMessage());
            return false;
        }
    }

    public static ArrayList<Utilisateur> lister() {
        return new ArrayList<>(utilisateurs); // Retourne une copie de la liste
    }

    public static boolean updateUser(int id, String prenom, String nom, String login, String password) {
        try {
            for (Utilisateur user : utilisateurs) {
                if (user.getId() == id) {
                    user.setPrenom(prenom);
                    user.setNom(nom);
                    user.setLogin(login);
                    user.setPassword(password);
                    return true;
                }
            }
            return false;
        } catch (Exception e) {
            System.err.println("Erreur lors de la modification de l'utilisateur : " + e.getMessage());
            return false;
        }
    }

    public static boolean modifyUser(Utilisateur user) {
        return updateUser(user.getId(), user.getPrenom(), user.getNom(), user.getLogin(), user.getPassword());
    }

    public static boolean delUser(int userId) {
        try {
            return utilisateurs.removeIf(utilisateur -> utilisateur.getId() == userId);
        } catch (Exception e) {
            System.err.println("Erreur lors de la suppression de l'utilisateur : " + e.getMessage());
            return false;
        }
    }

    public static Utilisateur find(int id) {
        for (Utilisateur utilisateur : utilisateurs) {
            if (utilisateur.getId() == id)
                return utilisateur;
        }
        return null;
    }

    public Utilisateur authentifier(String login, String password) {
        return utilisateurs.stream()
                .filter(u -> u.getLogin().equals(login) && u.getPassword().equals(password))
                .findFirst()
                .orElse(null);
    }
}
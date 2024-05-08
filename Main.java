import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Login
        System.out.print("Nom d'utilisateur : ");
        String username = scanner.nextLine();
        System.out.print("Mot de passe : ");
        String password = scanner.nextLine();

        // Authentification
        if (authenticate(username, password)) {
            // Rôle de l'utilisateur
            String role = getUserRole(username);

            // Affichage de l'interface en fonction du rôle
            switch (role) {
                case "étudiant":
                    showStudentInterface();
                    break;
                case "professeur":
                    showProfessorInterface();
                    break;
                case "offre de service":
                    showServiceOfferInterface();
                    break;
                default:
                    System.out.println("Rôle non reconnu.");
            }
        } else {
            System.out.println("Authentification échouée.");
        }

        scanner.close();
    }

    private static boolean authenticate(String username, String password) {
        // Code d'authentification
        // Vérifier les informations d'identification dans la base de données ou tout autre mécanisme d'authentification

        // Exemple simplifié
        if (username.equals("admin") && password.equals("password")) {
            return true;
        } else {
            return false;
        }
    }

    private static String getUserRole(String username) {
        // Code pour récupérer le rôle de l'utilisateur à partir de la base de données ou d'autres sources

        // Exemple simplifié
        if (username.equals("admin")) {
            return "professeur";
        } else if (username.equals("student")) {
            return "étudiant";
        } else if (username.equals("service")) {
            return "offre de service";
        } else {
            return "inconnu";
        }
    }

    private static void showStudentInterface() {
        // Code pour afficher l'interface des étudiants
        System.out.println("Interface des étudiants");
        // ...
    }

    private static void showProfessorInterface() {
        // Code pour afficher l'interface des professeurs
        System.out.println("Interface des professeurs");
        // ...
    }

    private static void showServiceOfferInterface() {
        // Code pour afficher l'interface de l'offre de service
        System.out.println("Interface de l'offre de service");
        // ...
    }
}
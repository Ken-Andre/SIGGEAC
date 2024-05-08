import org.jooq.DSLContext;
import org.jooq.Record;
import org.jooq.Result;
import org.jooq.impl.DSL;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ServiceOfferApplication {
    public static void main(String[] args) {
        // Connexion à la base de données
        try (Connection conn = getConnection()) {
            // Contrôle d'accès pour l'offre de services
            if (authenticate(conn, "service", "password")) {
                System.out.println("Bienvenue dans l'application offre de service !");
                // Logique spécifique à l'application offre de service
                DSLContext create = DSL.using(conn);

                // Exemple : Afficher tous les services disponibles
                Result<Record> result = create.select()
                        .from("services")
                        .fetch();

                for (Record record : result) {
                    String serviceName = record.getValue("service_name", String.class);
                    String description = record.getValue("description", String.class);
                    System.out.println("Service : " + serviceName);
                    System.out.println("Description : " + description);
                    System.out.println("------------------------");
                }
            } else {
                System.out.println("Authentification échouée.");
            }
        } catch (SQLException e) {
            System.out.println("Erreur de connexion à la base de données : " + e.getMessage());
        }
    }

    private static Connection getConnection() throws SQLException {
        String url = "jdbc:postgresql://localhost:5432/mydatabase";
        String username = "myuser";
        String password = "mypassword";
        return DriverManager.getConnection(url, username, password);
    }

    private static boolean authenticate(Connection conn, String username, String password) {
        // Utilisation de jOOQ pour la vérification des identifiants dans la base de données
        DSLContext create = DSL.using(conn);
        int count = create.selectCount()
                .from("users")
                .where("username = ? and password = ?", username, password)
                .fetchOne(0, int.class);

        return count == 1;
    }
}
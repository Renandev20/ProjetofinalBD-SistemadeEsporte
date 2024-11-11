import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DatabaseQuery {

    public static void selectData() {
        String query = "SELECT * FROM Fortaleza";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                System.out.println("ID: " + resultSet.getInt("id"));
                System.out.println("Nome: " + resultSet.getString("cores"));
            }

        } catch (SQLException e) {
            System.out.println("Erro ao realizar consulta: " + e.getMessage());
        }
    }

    public static void main(String[] args) {
        selectData();
    }
}

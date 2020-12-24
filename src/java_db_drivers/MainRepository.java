package java_db_drivers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.List;


public class MainRepository {

    private static final String DB_USER = "postgres";
    private static final String DB_PASSWORD = "qawsedrf102";
    private static final String DB_URL = "jdbc:postgresql://localhost:5432/11-906";

    public static void main(String[] args) throws Exception {
        Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

        UsersRepository usersRepository = new UsersRepositoryJdbcImpl(connection);

        List<User> users = usersRepository.findAllByAge(19);


    }
}

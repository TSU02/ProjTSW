package it.unisa.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import it.unisa.utils.DriverManagerConnectionPool;


public class UserDAO {

    public boolean authenticate(String email, String password) {
            
        Connection connection = null;
	    PreparedStatement statement = null;
	    ResultSet resultSet = null;

        try {
	        connection = DriverManagerConnectionPool.getConnection();
	        String query = "SELECT * FROM user WHERE ( email=? AND password=? )";
	        statement = connection.prepareStatement(query);
	        statement.setString(1, email);
	        statement.setString(2, password);
	        resultSet = statement.executeQuery();

	        if (resultSet.next()) {
                // L'utente è autenticato correttamente
                resultSet.close();
                statement.close();
                connection.close();
                return true;
            }
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (resultSet != null) {
	                resultSet.close();
	            }
	            if (statement != null) {
	                statement.close();
	            }
	            if (connection != null) {
	                connection.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

	    return false;
    }
    
    public int registerUser(String firstName, String lastName, String email, String password) {
        
        Connection connection = null;
	    PreparedStatement statement = null;
	    ResultSet resultSet = null;
	    int generatedId = -1; // Inizializziamo con un valore di errore

        try {
        	connection = DriverManagerConnectionPool.getConnection();
	        String query = "INSERT INTO user (firstName, lastName, email, password) VALUES (?, ?, ?, ?);";

	        // Passiamo il flag Statement.RETURN_GENERATED_KEYS al PreparedStatement
	        statement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
	        statement.setString(1, firstName);
	        statement.setString(2, lastName);
	        statement.setString(3, email);
	        statement.setString(4, password);
	        statement.executeUpdate();

	        // Otteniamo l'ID generato
	        resultSet = statement.getGeneratedKeys();
	        if (resultSet.next()) {
	            generatedId = resultSet.getInt(1);
	        }

	        connection.commit();
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (resultSet != null) {
	                resultSet.close();
	            }
	            if (statement != null) {
	                statement.close();
	            }
	            if (connection != null) {
	                connection.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
        
        return generatedId;

    }
    public boolean isEmailRegistered(String email) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DriverManagerConnectionPool.getConnection();
            String query = "SELECT * FROM user WHERE email = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, email);
            resultSet = statement.executeQuery();

            return resultSet.next(); // Restituisce true se l'email è già registrata
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return false;
    }

}
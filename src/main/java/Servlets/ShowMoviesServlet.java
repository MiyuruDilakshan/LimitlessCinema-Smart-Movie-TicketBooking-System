package Servlets;

import model.Movie;
import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;

public class ShowMoviesServlet extends HttpServlet {
    
    // Database credentials
    private static final String DB_URL = "jdbc:mysql://localhost:3308/movie"; // Replace with your DB name
    private static final String DB_USERNAME = "root"; // Replace with your DB username
    private static final String DB_PASSWORD = "12345678"; // Replace with your DB password

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Movie> movies = new ArrayList<>();
        
        // Database connection
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            // Step 1: Establish connection to database
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
            
            // Step 2: Query to retrieve movies
            String sql = "SELECT * FROM movies";
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);
            
            // Step 3: Process the result set and populate movie list
            while (resultSet.next()) {
                Movie movie = new Movie();
                movie.setMovieId(resultSet.getInt("movie_id"));
                movie.setTitle(resultSet.getString("title"));
                movie.setGenre(resultSet.getString("genre"));
                movie.setDuration(resultSet.getInt("duration"));
                movie.setRating(resultSet.getFloat("rating"));
                movie.setDescription(resultSet.getString("description"));
                movie.setImageUrl(resultSet.getString("image_url"));
                movies.add(movie);
            }
            
            // Step 4: Forward the movie list to the JSP page
            request.setAttribute("movies", movies);
            RequestDispatcher dispatcher = request.getRequestDispatcher("movies.jsp");
            dispatcher.forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

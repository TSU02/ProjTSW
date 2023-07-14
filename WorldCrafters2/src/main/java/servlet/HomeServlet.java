package servlet;

import model.Product;
import model.ProductDAO;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class HomeServlet
 */
//@WebServlet("/")
public class HomeServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Crea un'istanza di ProductDAO
	    ProductDAO productDAO = new ProductDAO();

	    // Chiama il metodo getAllProducts() per ottenere la lista di prodotti
	    List<Product> products = productDAO.getAllProducts();
		
		
		request.setAttribute("products", products);
			
		request.getRequestDispatcher("home.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>

<%
request.setAttribute("showHeader", true);
request.setAttribute("showFooter", true);
request.setAttribute("showSidebar", true);
%>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WorldCrafters</title>
    <link rel="icon" type="image/x-icon" href="images/favicon.ico">
    <link rel="stylesheet" type="text/css" href="styles/userbar.css">
    <link rel="stylesheet" type="text/css" href="vendor/flickity.min.css">
    <link rel="stylesheet" type="text/css" href="vendor/font-awesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="styles/log-reg.css">
    <link rel="stylesheet" type="text/css" href="styles/home.css">
    <script src="vendor/jquery.min.js"></script>
    <script src="vendor/flickity.pkgd.min.js"></script>
    <script src="scripts/script.js"></script>
</head>
<body>
    
    <%@ include file="header.jsp"%>
    <%@ include file="sidebar.jsp"%>
    
    <div id="userbar">
        <ul>
            <li>
                <button onclick="openModal('loginModal', 'log.jsp')">login</button>
                <!-- Finestra modale di login -->
                <div id="loginModal" class="modal"></div>
            </li>
            <li>
                <button onclick="openModal('registerModal', 'register.jsp')">register</button>
                <!-- Finestra modale di registrazione -->
                <div id="registerModal" class="modal"></div>
            </li>
            <li><a href="contact.jsp">Assistenza<br></a></li>
        </ul>
    </div>
    
    <main onclick="closeAll()">
        <div id="presentationContainer">
            <p>Fatti ispirare dalle tradizioni<br>artigianali di tutto<br>il mondo</p>
        </div>
        <div id="showcaseContainer">
            <h1>Prodotti in evidenza</h1><br>
            <div id="showcase">
                
                <% @SuppressWarnings("unchecked")
                   List<Product> products = (List<Product>) request.getAttribute("products"); %>
				<% for (int i = 0; i < 18; i++) { %>
					<% Product product = products.get(i); %>
				        <div class="product">
	                        <div class="product-image">
	                            <a href="#"><img src="<%= product.getImgSrc()%>"></a>
	                        </div>
	                        <div class="product-details">
	                            <a href="#" class="product-name"><%= product.getName() %></a>
	                            <div class="product-price">
	                                $ <%= product.getPrice() %>
	                            </div>
	                            <button class="add-to-cart">Add to cart</button>
	                        </div>
                    	</div>
				<%} %>
				
            </div>
        </div>
    </main>
    
    <%@ include file="footer.jsp" %>
    
</body>
</html>

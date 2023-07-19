<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<% 
	boolean showSidebar = false;
	showSidebar = (Boolean) request.getAttribute("showSidebar");
%>

<% if (showSidebar==true) { %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sidebar</title>
<link rel="stylesheet" type="text/css" href="styles/sidebar.css">

</head>
<body>
	<div id="sidebar">
        
	    <i onclick="toggleSidebar()" class="fa fa-times" aria-hidden="true"></i>
	    <h1>WorldCrafters</h1>
        
        <ul>
        	<li class="category"><button onclick="categoryClick('arte')">Arte </button><i class="fa fa-chevron-down" aria-hidden="true"></i></li>
				<li class="subcategory"><button onclick="categoryClick('fotografia')">Fotografia</button></li>
				<li class="subcategory"><button onclick="categoryClick('pittura')">Pittura</button></li>
				<li class="subcategory"><button onclick="categoryClick('scultura')">Scultura</button></li>
				<li class="subcategory"><button onclick="categoryClick('vetro')">Vetro<br><br></button></li>
				
			<li class="category"><button onclick="categoryClick('abbigliamento')">Abbigliamento </button><i class="fa fa-chevron-down" aria-hidden="true"></i></li>
				<li class="subcategory"><button onclick="categoryClick('abbigliamento_uomo')">Uomo</button></li>
				<li class="subcategory"><button onclick="categoryClick('abbigliamento_donna')">Donna</button></li>
				<li class="subcategory"><button onclick="categoryClick('abbigliamento_bambino')">Bambino</button></li>
				<li class="subcategory"><button onclick="categoryClick('borsa')">Borse<br><br></button></li>
			
			<li class="category"><button onclick="categoryClick('gioielli')">Gioielli </button><i class="fa fa-chevron-down" aria-hidden="true"></i></li>
				<li class="subcategory"><button onclick="categoryClick('anello')">Anelli</button></li>
				<li class="subcategory"><button onclick="categoryClick('bracciale')">Bracciali</button></li>
				<li class="subcategory"><button onclick="categoryClick('collana')">Collane</button></li>
				<li class="subcategory"><button onclick="categoryClick('orecchino')">Orecchini<br><br></button></li>
			
			<li class="category"><button onclick="categoryClick('intrattenimento')">Intrattenimento </button><i class="fa fa-chevron-down" aria-hidden="true"></i></li>
				<li class="subcategory"><button onclick="categoryClick('cinema')">Cinema</button></li>
				<li class="subcategory"><button onclick="categoryClick('libro')">Libri</button></li>
				<li class="subcategory"><button onclick="categoryClick('musica')">Musica</button></li>
				<li class="subcategory"><button onclick="categoryClick('gioco')">Giochi e giocattoli<br><br></button></li>
			
			<li class="category"><button onclick="categoryClick('accessorio')">Accessori<br><br></button></li>
			<li class="category"><button onclick="categoryClick('casa')">Casa e arredi<br><br></button></li>
			<li class="category"><button onclick="categoryClick('collezione')">Oggetti da collezione<br><br></button></li>
			<li class="category"><button onclick="categoryClick('elettronica')">Elettronica e accessori<br><br></button></li>
			<li class="category"><button onclick="categoryClick('animale_domestico')">Animali domestici<br><br></button></li>
			<li class="category"><button onclick="categoryClick('vintage')">Vintage<br><br></button></li>

        </ul>
    </div>
    
	<script src="scripts/sidebar.js"></script>
    
</body>
</html>
<% } %>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="OrientDBClient.Movie"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="WebContent/css/Style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
		
			body {
				margin:0;
				padding:0;
				font-family: Sans-Serif;
				line-height: 1.5em;
			}
			
			#header {
				background: #ccc;
				height: 100px;
			}
			
			#header h1 {
				margin: 0;
				padding-top: 15px;
			}
			
			main {
				padding-bottom: 10010px;
				margin-bottom: -10000px;
				float: left;
				width: 100%;
			}
			
			#nav {
				padding-bottom: 10010px;
				margin-bottom: -10000px;
				float: left;
				width: 230px;
				margin-left: -100%;
				background: #eee;
			}
			
			#footer {
				clear: left;
				width: 100%;
				background: #ccc;
				text-align: center;
				padding: 4px 0;
			}
	
			#wrapper {
				overflow: hidden;
			}
						
			#content {
				margin-left: 230px; /* Same as 'nav' width */
			}
			
			.innertube {
				margin: 15px; /* Padding for content */
				margin-top: 0;
			}
		
			p {
				color: #555;
			}
	
			nav ul {
				list-style-type: none;
				margin: 0;
				padding: 0;
			}
			
			nav ul a {
				color: darkgreen;
				text-decoration: none;
			}
		
		</style>
	
</head>
<body>
<header id="header">
			<div class="innertube">
				<h1>The Movies DataBase</h1><br />
				<h7>The right place to know all about Movies!!!!!</h7>
			</div>
		</header>
		
		<div id="wrapper">
		
			<main>
				<div id="content">
					<div class="innertube">
	<h2>
            <a href="/OrientDBClient3/newMovieForm">Add New Movie</a>
            &nbsp;&nbsp;&nbsp;
            <a href="/OrientDBClient3/MoviesList">List All Movies</a>
             
       </h2>
<table border="1" cellpadding="5">
<tr>
	<th style="display:none;">StarID</th>
	<th>Title</th>
	<th>Genre</th>
	<th>Year</th>
	<th>Length</th>
	<th>Actions</th>
</tr>
   <% 
   ArrayList m = (ArrayList)request.getAttribute("ListOfMovies");  
   for (int i = 0; i < m.size(); i++) { 
	   Movie ms = (Movie)m.get(i); %>  
       
       <tr>
       <td><% out.print(ms.Title); %></td>
       <td><% out.print(ms.Genre); %></td>
       <td><% out.print(ms.Year); %></td>
       <td><% out.print(ms.Length); %></td>
       <td><a href="/OrientDBClient3/MovieDetail?Title='<% out.print(ms.Title);%>'" id = "DetailLink">Detail</a> | <a href="#"> Edit</a> | <a href="/OrientDBClient3/DeleteMovie?Title='<% out.print(ms.Title);%>'" id="DeleteLink"> Delete</a></td>
       </tr>
       <!-- close the loop -->
   <% } %>
   <!-- close table -->
   </table>
					</div>
				</div>
			</main>
			
			<nav id="nav">
				<div class="innertube">
					<h3>Left heading</h3>
					<ul>
					<li><a href="#">List of movies</a></li>
						<li><a href="#">List of Movie Stars</a></li>
					</ul>
					
				</div>
			</nav>
		
		</div>
		
		<footer id="footer">
			<div class="innertube">
				<p>Developers:Afonso Gouveia Antunes;Azucena del Mar Aragon Boza;Eskaif Nedal;Jinhyeon Hong;Minase Mekete Mengistu;Nasantogtokh Amarsaikhan;Raphael Cyril Esteveny;Willy Zhao</p> -->
			</div>
		</footer>
</body>
</html>
    
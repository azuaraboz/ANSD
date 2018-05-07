<%@page import="OrientDBClient.Studio"%>
<%@page import="java.awt.print.Printable"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="OrientDBClient.MovieStar"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
<title>Insert title here</title>
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
       
       <form action="/OrientDBClient3/insertMovie" method="post">
       <table>
       <tr>
       <td><label>Title:</label></td>
       <td><input type="text" name="Title"></td>
       </tr>
       <tr>
       <td><label>Year:</label></td>
       <td><input type="text" name="Year"></td>
       </tr>
       <tr>
       <td><label>Genre:</label></td>
       <td>
       <select name="Genre">
       <option value="null">------------ Select ------------</option>
       	<option value="Comedy">Comedy</option>
       	<option value="Action">Action</option>
       	<option value="Drama">Drama</option>
       	<option value="Adventure">Adventure</option>
       </select>
       
       </td>
       </tr>
       <tr>
       <td><label>Length:</label></td>
       <td><input type="text" name="Length"><br /></td>
       </tr>
       <tr>
       <td><label>Casts:</label></td>
       <td>
       <hr />
       <% 
   ArrayList ms = (ArrayList)request.getAttribute("ListOfMovies");  
   for (int i = 0; i < ms.size(); i++) { 
	   MovieStar star = (MovieStar)ms.get(i); %>  
       <input type="checkbox" name="Cast" value="<% out.print(star.StarID);%>"><% out.print(star.Name);%><br/>
       <!-- close the loop -->
   <% } %>
   <hr />
       </td>
       </tr>
       <tr>
       <td>
       </td>
       <td>
       <input type="Submit" value="Add New Movie">
       </td>
       </tr>
       </table>
       </form>

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
				<p>Developers:Afonso Gouveia Antunes;Azucena del Mar Aragon Boza;Eskaif Nedal;Jinhyeon Hong;Minase Mekete Mengistu;Nasantogtokh Amarsaikhan;Raphael Cyril Esteveny;Willy Zhao</p>
			</div>
		</footer>
</body>
</html>
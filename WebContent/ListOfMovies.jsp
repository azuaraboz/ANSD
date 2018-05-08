<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="OrientDBClient.MovieStar"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
			#customers {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

#customers td, #customers th {
    border: 1px solid #ddd;
    padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #4CAF50;
    color: white;
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
            <a href="/OrientDBClient3/newMovieStarForm">Add New Movie Star</a>
            &nbsp;&nbsp;&nbsp;
            <a href="/OrientDBClient3/ListOfStars">List All Movie Stars</a>
             
       </h2>
 <form action = "/OrientDBClient3/ListOfStars" method="post">
	<input type="text" name="SearchKey">
	<input type="submit" value="Find Star by Name">
</form>
<hr />
<table id="customers">
<tr>
	<th style="display:none;">StarID</th>
	<th>Name</th>
	<th>Address</th>
	<th>Gender</th>
	<th>Birth Date</th>
	<th>Actions</th>
</tr>
   <% 
   ArrayList ms = (ArrayList)request.getAttribute("ListOfMovies");  
   for (int i = 0; i < ms.size(); i++) { 
	   MovieStar user = (MovieStar)ms.get(i); %>  
       
       <tr>
       <td style="display:none;"><% out.print(user.StarID); %></td>
       <td><% out.print(user.Name); %></td>
       <td><% out.print(user.Address); %></td>
       <td><% out.print(user.Gender); %></td>
       <td><% out.print(user.BirthDate); %></td>
       <td><a href="/OrientDBClient3/Detail?StarID='<% out.print(user.StarID);%>'" id = "DetailLink">Detail</a> | <a href="/OrientDBClient3/edit?StarID='<% out.print(user.StarID);%>'"> Edit</a> | <a href="/OrientDBClient3/delete?StarID='<% out.print(user.StarID);%>'" id="DeleteLink"> Delete</a></td>
       <!-- close row -->
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
    
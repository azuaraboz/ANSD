<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="OrientDBClient.Movie"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
  <title>The Movies Database</title>
  <meta name="description" content="website description" />
  <meta name="keywords" content="website keywords, website keywords" />
  <meta http-equiv="content-type" content="text/html; charset=windows-1252" />
  <style><%@include file="/WEB-INF/style/style.css"%></style>
</head>

<body>
  <div id="main">
    <div id="header">
      <div id="logo">
        <div id="logo_text">
          <!-- class="logo_colour", allows you to change the colour of the text -->
          <h1><a href="index.html">The Movies<span class="logo_colour">Database</span></a></h1>
          <h2>The right place to know all about movies!!!</h2>
        </div>
      </div>
      <div id="menubar">
        <ul id="menu">
          <!-- put class="selected" in the li tag for the selected page - to highlight which page you're on -->
          <li class="selected"><a href="#">Home</a></li>
          <li><a href="#">About</a></li>
        </ul>
      </div>
    </div>
    <div id="content_header"></div>
    <div id="site_content">
	  <div id="sidebar_container">
        <div class="sidebar">
          <div class="sidebar_top"></div>
          <div class="sidebar_base"></div>
        </div>
        <div class="sidebar">
          <div class="sidebar_top"></div>
          <div class="sidebar_item">
            <h3>Useful Links</h3>
            <ul>
              <li><a href="#">Go to Movies</a></li>
              <li><a href="#">Go to Movie Stars</a></li>
            </ul>
          </div>
          <div class="sidebar_base"></div>
        </div>
      </div>
      <div id="content">
      <h2>
            <a href="/OrientDBClient3/newMovieForm">Add New Movie</a>
            &nbsp;&nbsp;&nbsp;
            <a href="/OrientDBClient3/MoviesList">List All Movies</a>
             
       </h2>
<form action = "/OrientDBClient3/MoviesList" method="post">
	<input type="text" name="SearchKey" width="500">
	<input type="submit" value="Find a by Movie Title">
</form>
<hr />
<table id="customers">
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
    <div id="content_footer"></div>
	
    <div id="footer">
	<p>Developers:Afonso Gouveia Antunes;Azucena del Mar Aragon Boza;Eskaif Nedal;Jinhyeon Hong;Minase Mekete Mengistu;Nasantogtokh Amarsaikhan;Raphael Cyril Esteveny;Willy Zhao</p>
    </div>
  </div>
</body>
</html>

    
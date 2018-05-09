<%@page import="OrientDBClient.Studio"%>
<%@page import="java.awt.print.Printable"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="OrientDBClient.MovieStar"%>
<%@page import="java.util.ArrayList"%>
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
        			<div class="innertube">
	<h2>
            <a href="/OrientDBClient3/newMovieForm">Add New Movie</a>
            &nbsp;&nbsp;&nbsp;
            <a href="/OrientDBClient3/MoviesList">List All Movies</a>
             
       </h2>
       
       <form action="/OrientDBClient3/insertMovie" method="post" enctype="multipart/form-data">
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
       <option value="null">--------Select--------</option>
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
    <div id="content_footer"></div>
	
    <div id="footer">
	<p>Developers:Afonso Gouveia Antunes;Azucena del Mar Aragon Boza;Eskaif Nedal;Jinhyeon Hong;Minase Mekete Mengistu;Nasantogtokh Amarsaikhan;Raphael Cyril Esteveny;Willy Zhao</p>
    </div>
  </div>
</body>
</html>

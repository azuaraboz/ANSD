<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="OrientDBClient.MovieStar"%>
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
    <div id="content_footer"></div>
	
    <div id="footer">
	<p>Developers:Afonso Gouveia Antunes;Azucena del Mar Aragon Boza;Eskaif Nedal;Jinhyeon Hong;Minase Mekete Mengistu;Nasantogtokh Amarsaikhan;Raphael Cyril Esteveny;Willy Zhao</p>
    </div>
  </div>
</body>
</html>
 
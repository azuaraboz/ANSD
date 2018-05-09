<%@page import="OrientDBClient.Movie"%>
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
        <table border="0" cellpadding="5">
<tr>
	<th style="display:none;">StarID</th>
	<th>Title</th>
	<th>Year</th>
	<th>Genre</th>
	<th>Length</th>
</tr>
   <% 
   Movie mov = (Movie)request.getAttribute("SelectedMovie");
   %>
   <tr>
   	<td><%out.print(mov.Title); %></td>
   	<td><%out.print(mov.Year); %></td>
   	<td><%out.print(mov.Genre); %></td>
   	<td><%out.print(mov.Length); %></td>
   </tr>

   <!-- close table -->
   </table>
    <ul>
   <% 
   ArrayList casts = (ArrayList)request.getAttribute("CastsName");
   for(int i = 0; i< casts.size(); i++ )
   {
	   String name = casts.get(i).toString();
   %>
   	
   	<li><%out.print(name); %></li>
	   
  <% }%> 
   
   
   
   </ul>
   <a href="/OrientDBClient3/MoviesList">Back to List</a>
        
      </div>
    </div>
    <div id="content_footer"></div>
	
    <div id="footer">
	<p>Developers:Afonso Gouveia Antunes;Azucena del Mar Aragon Boza;Eskaif Nedal;Jinhyeon Hong;Minase Mekete Mengistu;Nasantogtokh Amarsaikhan;Raphael Cyril Esteveny;Willy Zhao</p>
    </div>
  </div>
</body>
</html>
 
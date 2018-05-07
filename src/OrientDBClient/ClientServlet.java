package OrientDBClient;

import java.awt.List;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.orientechnologies.orient.core.db.ODatabaseSession;
import com.orientechnologies.orient.core.db.OrientDB;
import com.orientechnologies.orient.core.db.OrientDBConfig;
import com.orientechnologies.orient.core.metadata.function.OFunction;
import com.orientechnologies.orient.core.record.OVertex;
import com.orientechnologies.orient.core.sql.executor.OResult;
import com.orientechnologies.orient.core.sql.executor.OResultSet;

/**
 * Servlet implementation class ClientServlet
 */
@WebServlet("/ClientServlet")
public class ClientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getServletPath();
		
		switch (action) {
		case "/MoviesList":
			ListOfMovies(request,response);
			break;
		case "/newMovieForm":
			AddNewMovie(request,response);
			break;
        case "/newMovieStarForm":
        	AddNewMovieStar(request,response);
            break;
        case "/insert":
            AddNewStar(request,response);
            break;
        case "/insertMovie":
        	insertNewMovie(request,response);
        	break;
        case "/MovieDetail":
        	MovieDetail(request,response);
        	break;
        case "/delete":
        	deleteMovieStar(request,response);
            break;
        case "/DeleteMovie":
        	deleteMovie(request,response);
        	break;
        case "/edit":
        	EditMovieStarForm(request,response);
            break;
        case "/update":
        	EditMovieStar(request,response);
            break;
        case "/Detail":
        	MovieDetail(request,response);
        	break;
        case "/ListOfStars":
        	listMovieStars(request, response);
        	break;
        default:
        	indexPage(request,response);
            break;
        }
		
	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private void indexPage(HttpServletRequest request,HttpServletResponse response)
	{
		RequestDispatcher dispatcher = request.getRequestDispatcher("Index.jsp");
	    try {
			dispatcher.forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
		
	}
	
	private void ListOfMovies(HttpServletRequest request,HttpServletResponse response) {
		 OrientDB orient = new OrientDB("remote:localhost", OrientDBConfig.defaultConfig());
		 ODatabaseSession db =  orient.open("Movies","root","root12345");
		 String query = "select * from Movie";
		 OResultSet rs = db.query(query);
		 ArrayList result = new ArrayList();
		 while(rs.hasNext())
		 {
			 OResult item = rs.next();
			 String Title = item.getProperty("Title");
			 String Genre = item.getProperty("Genre");
			 int Year = item.getProperty("Year");
			 int Length = item.getProperty("Length");
			 
			 Movie m = new Movie(Title,Genre,Year,Length);
			 result.add(m);
		 }
		 
		 db.close();
		 orient.close();
		request.setAttribute("ListOfMovies", result);
	    RequestDispatcher dispatcher = request.getRequestDispatcher("MoviesList.jsp");
	    try {
			dispatcher.forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	        
		 	
	}
	
	private void listMovieStars(HttpServletRequest request, HttpServletResponse response)
	{
		OrientDB orient = new OrientDB("remote:localhost", OrientDBConfig.defaultConfig());
		 ODatabaseSession db =  orient.open("Movies","root","root12345");
		 String query = "select * from MovieStar";
		 OResultSet rs = db.query(query);
		 ArrayList result = new ArrayList();
		 while(rs.hasNext())
		 {
			 OResult item = rs.next();
			 String Name = item.getProperty("Name");
			 String Address = item.getProperty("Address");
			 String Gender = item.getProperty("Gender");
			 String BirthDate = item.getProperty("BirthDate").toString();
			 String StarID = item.getProperty("StarID");
			 
			 MovieStar ms = new MovieStar(StarID, Name, Address, Gender, BirthDate);
			 result.add(ms);
		 }
		 
		 db.close();
		 orient.close();
		request.setAttribute("ListOfMovies", result);
	    RequestDispatcher dispatcher = request.getRequestDispatcher("ListOfMovies.jsp");
	    try {
			dispatcher.forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	        
	    
	}
	
	private void AddNewMovie(HttpServletRequest request,HttpServletResponse response)
	{
		 OrientDB orient = new OrientDB("remote:localhost", OrientDBConfig.defaultConfig());
		 ODatabaseSession db =  orient.open("Movies","root","root12345");
		 String queryMS = "select * from MovieStar";
		 //String queryStudio = "select * from Studio";
		 OResultSet rsCast = db.query(queryMS);
		 //OResultSet rsStudio = db.query(queryStudio);
		 ArrayList CastResult = new ArrayList();
		 //ArrayList StudioResult = new ArrayList();
		 
		 while(rsCast.hasNext())
		 {
			 OResult item = rsCast.next();
			 String Name = item.getProperty("Name");
			 String Address = item.getProperty("Address");
			 String Gender = item.getProperty("Gender");
			 String BirthDate = item.getProperty("BirthDate").toString();
			 String StarID = item.getProperty("StarID");
			 
			 MovieStar ms = new MovieStar(StarID, Name, Address, Gender, BirthDate);
			 CastResult.add(ms);
			 
		 }
		
		 db.close();
		 orient.close(); 
		request.setAttribute("ListOfMovies",CastResult);
		RequestDispatcher dispatcher = request.getRequestDispatcher("AddNewMovie.jsp");
		try {
			dispatcher.forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public void deleteMovie(HttpServletRequest request,HttpServletResponse response)
	{
		String title = request.getParameter("Title").toString();
		OrientDB orient = new OrientDB("remote:localhost", OrientDBConfig.defaultConfig());
		ODatabaseSession db =  orient.open("Movies","root","root12345");
		 
		String query = "DELETE VERTEX Movie WHERE Title =  " + title;
		 
		
		try {
			 db.command(query);
			 db.close();
			 orient.close();
			response.sendRedirect("/OrientDBClient3/MoviesList");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}
	public void insertNewMovie(HttpServletRequest request,HttpServletResponse response)
	{
		 OrientDB orient = new OrientDB("remote:localhost", OrientDBConfig.defaultConfig());
		 ODatabaseSession db =  orient.open("Movies","root","root12345");
		 
		 String title = request.getParameter("Title");
		 String Year = request.getParameter("Year");
		 String Genre = request.getParameter("Genre");
		 String Length = request.getParameter("Length");
		 String[] Cast = request.getParameterValues("Cast");
		 
		 
		 OVertex newMovie = db.newVertex("Movie");
		 newMovie.setProperty("Title", title);
		 newMovie.setProperty("Year", Year);
		 newMovie.setProperty("Length", Length);
		 newMovie.setProperty("Genre", Genre);
		 newMovie.save();
		 db.close();
		 orient.close(); 
		 MovieCastAss(Cast,title);
		 
		 try {
			response.sendRedirect("/OrientDBClient3/MoviesList");
		} catch (IOException e) {
			e.printStackTrace();
		}
		 
				
	}
	private void AddNewMovieStar(HttpServletRequest request,HttpServletResponse response) {
		RequestDispatcher dispatcher = request.getRequestDispatcher("AddNewStar.jsp");
        try {
			dispatcher.forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	private void AddNewStar(HttpServletRequest request,HttpServletResponse response)
	{
		 OrientDB orient = new OrientDB("remote:localhost", OrientDBConfig.defaultConfig());
		 ODatabaseSession db =  orient.open("Movies","root","root12345");
		 
		 String Name = request.getParameter("StarName");
		 String Address = request.getParameter("StarAddress");
		 String Gender = request.getParameter("StarGender");
		 String StarBD = request.getParameter("StarBD");
		 String uniqueID = UUID.randomUUID().toString();
		 
		 OVertex newStar = db.newVertex("MovieStar");
		 newStar.setProperty("Name", Name);
		 newStar.setProperty("Address", Address);
		 newStar.setProperty("Gender", Gender);
		 newStar.setProperty("BirthDate", StarBD);
		 newStar.setProperty("StarID", uniqueID);
		 newStar.save();
		 db.close();
		 orient.close();
		 
		 try {
			response.sendRedirect("/OrientDBClient3/ListOfStars");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
				
		
		
	}
	private void EditMovieStarForm(HttpServletRequest request,HttpServletResponse response)
	{
		 String SID = (request.getParameter("StarID")).toString();
		 OrientDB orient = new OrientDB("remote:localhost", OrientDBConfig.defaultConfig());
		 ODatabaseSession db =  orient.open("Movies","root","root12345");
		 String query = "SELECT FROM MovieStar WHERE StarID = "+ SID ;
		 
		 OResultSet rs = db.query(query);
		 MovieStar ms = new MovieStar();
		 while(rs.hasNext())
		 {
			 OResult item = rs.next();
			 ms.Name = item.getProperty("Name");
			 ms.Address = item.getProperty("Address");
			 ms.Gender = item.getProperty("Gender");
			 ms.BirthDate = item.getProperty("BirthDate").toString();
			 ms.StarID = item.getProperty("StarID");
			 
		 }
		 db.close();
		 orient.close();
		request.setAttribute("StarToEdit", ms);
	    RequestDispatcher dispatcher = request.getRequestDispatcher("MovieStarEdit.jsp");
	    try {
			dispatcher.forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		 
		
	}
	private void EditMovieStar(HttpServletRequest request,HttpServletResponse response)
	{
		 String SID = request.getParameter("StarID");
		 String Name = request.getParameter("Name");
		 String Address = request.getParameter("Address");
		 String BirthDate = request.getParameter("BirthDate");
		 OrientDB orient = new OrientDB("remote:localhost", OrientDBConfig.defaultConfig());
		 ODatabaseSession db =  orient.open("Movies","root","root12345");
		 
		 String query = "Update MovieStar set name = \"" + Name +"\" UPSERT Where StarID = \"" + SID +"\"" ;
		 db.command(query);
		 	
		 db.close();
		 orient.close();
		 
		 try {
				response.sendRedirect("/OrientDBClient3");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		 
	}
		
	private void deleteMovieStar(HttpServletRequest request,HttpServletResponse response)
	{
		String SID = request.getParameter("StarID").toString();
		OrientDB orient = new OrientDB("remote:localhost", OrientDBConfig.defaultConfig());
		ODatabaseSession db =  orient.open("Movies","root","root12345");
		 
		String query = "DELETE VERTEX MovieStar WHERE StarID =  " + SID;
		 
		
		try {
			 db.command(query);
			 db.close();
			 orient.close();
			response.sendRedirect("/OrientDBClient3/ListOfStars");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
		
	}
	private void MovieCastAss(String[] Cast,String title)
	{
		for(int i=0; i< Cast.length; i++)
			
		 { 
			OrientDB orient = new OrientDB("remote:localhost", OrientDBConfig.defaultConfig());
			ODatabaseSession db =  orient.open("Movies","root","root12345");
			String query = "Create edge Casts from (select * from MovieStar where StarID=\'"+Cast[i]+"\')"
			 		+ " to (select * from Movie where Title = \'"+title+"\')";
			db.command(query);
			db.close();
			orient.close(); 
		 }
		
		
	}
	private void MovieDetail(HttpServletRequest request,HttpServletResponse response)
	{
		OrientDB orient = new OrientDB("remote:localhost", OrientDBConfig.defaultConfig());
		ODatabaseSession db =  orient.open("Movies","root","root12345");
		String moveTitle = request.getParameter("Title");
		String query = "Select * From Movie where Title = "+moveTitle;
		Movie selectedMovie = new Movie();
		OResultSet rs = db.query(query);
		while(rs.hasNext())
		{
		OResult item =  rs.next();
		selectedMovie.Title = item.getProperty("Title");
		selectedMovie.Year = item.getProperty("Year");
		selectedMovie.Genre = item.getProperty("Genre");
		selectedMovie.Length = item.getProperty("Length");
		}
		request.setAttribute("SelectedMovie", selectedMovie);
		request.setAttribute("CastsName", getCastesForMovie(moveTitle));
	    RequestDispatcher dispatcher = request.getRequestDispatcher("MovieDetail.jsp");
	    try {
			dispatcher.forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.close();
		orient.close(); 
	}
	
	private ArrayList<String> getCastesForMovie(String moveTitle)
	{
		OrientDB orient = new OrientDB("remote:localhost", OrientDBConfig.defaultConfig());
		ODatabaseSession db =  orient.open("Movies","root","root12345");
		
		String castsQuery = "Select expand(in(Casts))from Movie where Title="+ moveTitle;
		OResultSet castsResult = db.command(castsQuery);
		ArrayList<String> castsName = new ArrayList<String>();
		while(castsResult.hasNext()) {
			OResult cast = castsResult.next();
			castsName.add(cast.getProperty("Name").toString());
		
		}
		db.close();
		orient.close();
		
		return castsName;
	}
	
}

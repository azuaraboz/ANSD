import com.orientechnologies.orient.core.db.ODatabaseSession;
import com.orientechnologies.orient.core.db.OrientDB;
import com.orientechnologies.orient.core.db.OrientDBConfig;
import com.orientechnologies.orient.core.sql.executor.OResult;
import com.orientechnologies.orient.core.sql.executor.OResultSet;
public class Hello {
	
	public static void main(String[] args) {
		//System.out.println(printMessage());
		
		OrientDB orient = new OrientDB("remote:localhost", OrientDBConfig.defaultConfig());

		ODatabaseSession db = orient.open("Movies", "root", "root123456");
		String query = "select from movie";
		OResultSet rs = db.query(query);
		
		while(rs.hasNext())
		{
			OResult item = rs.next();
			 System.out.println(item.getProperty("Title").toString());
		}
		
		
		
		db.close();

	    orient.close();
		
	}
	
	public static String printMessage() {
		
		return("Hello world from a method!!!");
	}

}

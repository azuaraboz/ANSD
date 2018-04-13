package OrientDBClient;

public class MovieStar {
	public String Name;
	public String Address;
	public String Gender;
	public String BirthDate;
	public String StarID;
	
	public MovieStar()
	{
		
	}
	
	public MovieStar(String StarID,String Name,String Address,String Gender,String BirthDate)
	{
		this.Name = Name;
		this.Address = Address;
		this.Gender = Gender;
		this.BirthDate = BirthDate;
		this.StarID = StarID;
		
	}

}

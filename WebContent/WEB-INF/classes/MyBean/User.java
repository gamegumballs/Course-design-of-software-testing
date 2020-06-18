package MyBean;
public class User{
	private String login_name;
	private String login_password;
	public User(){}
	public String getLogin_name(){
		return login_name;
	}
	public void setLogin_name(String name){
		login_name=name;
	}
	public String getLogin_Password(){
		return login_password;
	}
	public void setLogin_password(String password){
		login_password=password;
	}
}
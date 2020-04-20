package show.bean;

public class User {
	private String UserName;    //用户名
	private String PassWord;    //密码
	private String Sex;         //性别
	private int Age;            //出生日期
	private String Home;        //家庭地址
	private int id;             //ID
	//获取用户id
	public int getId(){
		return id;
	}
	//设置用户id
	public void setId(int id) {
		this.id=id;
	}
	//获取用户名称
	public String getUserName() {
		return UserName;
	}
    public void setUserName(String Name) {
    	this.UserName = Name;
    }
    //获取用户密码
    public String getPassWord(){
    	return PassWord;
    }
    //设置用户密码
	public void setPassWord(String password) {
		this.PassWord = password;
	}
	//获取用户性别
	public String getSex() {
		return Sex;
	}
	//设置用户性别
	public void setSex(String sex) {
		this.Sex = sex;
	}
	//获取用户出生日期
	public int getAge() {
		return Age;
	}
	//设置用户出生日期
	public void setAge(int age) {
		this.Age = age;
	}
	 //获取家庭地址
    public String getHome(){
    	return Home;
    }
    //设置家庭地址
	public void setHome(String home) {
		this.Home = home;
	}
}

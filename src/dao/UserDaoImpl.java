package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
 
import show.bean.User;
import show.util.DBconn;
//用户数据相关操作
public class UserDaoImpl implements UserDao{
	//用户注册，增加用户
	public boolean register(User user) {
		boolean flag = false;
		DBconn.init();
		int i =DBconn.addUpdDel("insert into alluser(UserName,PassWord,Sex,Age,Home) " +
				"values('"+user.getUserName()+"','"+user.getPassWord()+"','"+user.getSex()+"','"+user.getAge()+"','"+user.getHome()+"')");
		if(i>0){
			flag = true;
		}
		DBconn.closeConn();
		return flag;
	}
	//用户登录
    public boolean login(String name, String pwd) {
		boolean flag = false;
		try {
			    DBconn.init();
				ResultSet rs = DBconn.selectSql("select * from alluser where name='"+name+"' and pwd='"+pwd+"'");
				while(rs.next()){
					if(rs.getString("name").equals(name) && rs.getString("pwd").equals(pwd)){
						flag = true;
					}
				}
				DBconn.closeConn();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
    //获取用户表的所有信息。
	public List<User> getUserAll() {
		List<User> list = new ArrayList<User>();
    	try {
		    DBconn.init();
			ResultSet rs = DBconn.selectSql("select * from alluser");
			while(rs.next()){
				User user = new User();
				user.setId(rs.getInt("id"));
				user.setUserName(rs.getString("name"));
				user.setPassWord(rs.getString("pwd"));
				user.setSex(rs.getString("sex"));
				user.setAge(rs.getInt("age"));
				user.setHome(rs.getString("home"));
				list.add(user);
			}
			DBconn.closeConn();
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	//更改用户
	public boolean update(int id,String name, String pwd,String sex, String age,String home) {
		boolean flag = false;
		DBconn.init();
		String sql ="update alluser set name ='"+name
				+"' , pwd ='"+pwd
				+"' , sex ='"+sex
				+"' , age ='"+age
				+"' , home ='"+home+"' where id = "+id;
		int i =DBconn.addUpdDel(sql);
		if(i>0){
			flag = true;
		}
		DBconn.closeConn();
		return flag;
	}
	//删除用户
	public boolean delete(int id) {
		boolean flag = false;
		DBconn.init();
		String sql = "delete  from alluser where id="+id;
		int i =DBconn.addUpdDel(sql);
		if(i>0){
			flag = true;
		}
		DBconn.closeConn();
		return flag;
	}

}

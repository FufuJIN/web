package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.text.*;
 
import show.bean.Data;
import show.bean.DataEchats;
import show.util.DBconn;

public class DataDaoImpl implements DataDao{
	public List<Data> getDataAll(String name) {
		List<Data> list = new ArrayList<Data>();
		try {
		    DBconn.init();
			ResultSet rs = DBconn.selectSql("select * from data where username ='"+name+"'"); //where username='\"+name+\"'\"
			while(rs.next()){	
				Data data = new Data();
				data.setId(rs.getInt("id"));
				data.setCid(rs.getInt("cid"));
				data.setUserName(rs.getString("username"));
				data.setSPO2(rs.getInt("SPO2"));
				data.setPR(rs.getInt("PR"));
				data.setDatatime(rs.getLong("datatime"));
				list.add(data);
			}
			DBconn.closeConn();
			return list;
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean addData(Data data) {   //添加一条数据
		// TODO Auto-generated method stub
		boolean flag = false;
		DBconn.init();
		int i =DBconn.addUpdDel("insert into data(cid,username,SPO2,PR,datatime) " +
				"values('"+data.getCid()+"','"+data.getUserName()+"','"+data.getSPO2()+"','"+data.getPR()
				+"','"+data.getDatatime()+"')");
		if(i>0){
			flag = true;
		}
		DBconn.closeConn();
		return flag;
	}

	@Override
	public List<Data> getDataByDate(String name, long beginTime, long endTime) {
		// TODO Auto-generated method stub
		List<Data> list = new ArrayList<Data>();
		try {
		    DBconn.init();
			ResultSet rs = DBconn.selectSql("select * from data where username='"+name+"' and datatime>"+beginTime+"and datatime<"+endTime);
			while(rs.next()){
				Data data = new Data();
				data.setId(rs.getInt("id"));
				data.setCid(rs.getInt("cid"));
				data.setUserName(rs.getString("username"));
				data.setSPO2(rs.getInt("SPO2"));
				data.setPR(rs.getInt("PR"));
				data.setDatatime(rs.getLong("datatime"));
				list.add(data);
			}
			DBconn.closeConn();
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public ArrayList<DataEchats> getDataEchats(String name) {
		// TODO Auto-generated method stub
		
		try {
			DBconn.init();
			ResultSet rs = DBconn.selectSql("select * from data where username ='"+name+"'");
	        ArrayList<DataEchats> array = new ArrayList<DataEchats>();
	        while(rs.next())
	        {
	        	DataEchats line = new DataEchats();
	        	SimpleDateFormat ft = 
	        		      new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
	            line.setName(ft.format(rs.getLong("datatime")));
	            line.setNumSPO2(rs.getInt("SPO2"));
	            line.setNumPR(rs.getInt("PR"));
	            array.add(line);  
	        }
	        DBconn.closeConn();
	        return array;
		}catch (SQLException e) {
			e.printStackTrace();
            return new ArrayList<DataEchats>();
		}
	}
	
	@Override
	public ArrayList<DataEchats> getDataEchatsByDate(String name,long beginTime,long endTime){
		try {
			DBconn.init();
			ResultSet rs = DBconn.selectSql("select * from data where username='"+name+"' and datatime>'"+beginTime+"' and datatime<'"+endTime+"'");
	        ArrayList<DataEchats> array = new ArrayList<DataEchats>();
	        while(rs.next())
	        {
	        	DataEchats line = new DataEchats();
	        	SimpleDateFormat ft = 
	        		      new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
	            line.setName(ft.format(rs.getLong("datatime")));
	            line.setNumSPO2(rs.getInt("SPO2"));
	            line.setNumPR(rs.getInt("PR"));
	            array.add(line);  
	        }
	        DBconn.closeConn();
	        return array;
		}catch (SQLException e) {
			e.printStackTrace();
            return new ArrayList<DataEchats>();
		}
		
	}
	

}

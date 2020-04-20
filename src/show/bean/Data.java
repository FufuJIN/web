package show.bean;

public class Data {
	private int id;
	private int cid;
	private String UserName;
	private int SPO2;
	private int PR;
	private long datatime;
	
	//获取用户id
	public int getId(){
			return id;
	}
	public void setId(int id){
	      this.id=id;
	}
	
	public int getCid(){
		return cid;
    }
	public void setCid(int cid){
	      this.cid=cid;
	}
	
	public String getUserName(){
		return UserName;
	}
	public void setUserName(String UserName){
	      this.UserName=UserName;
	}
	
	public int getSPO2(){
		return SPO2;
    }
	public void setSPO2(int SPO2) {
	    this.SPO2=SPO2;
	}
	
	public int getPR(){
		return PR;
    }
	public void setPR(int PR) {
	    this.PR=PR;
	}
	
	public long getDatatime(){
		return datatime;
    }
	public void setDatatime(long datatime) {
	    this.datatime=datatime;
	}
}

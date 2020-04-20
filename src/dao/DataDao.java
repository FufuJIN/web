package dao;

import java.util.ArrayList;
import java.util.List;
import show.bean.Data;
import show.bean.DataEchats;

public interface DataDao {
	public List<Data> getDataAll(String name);                                  //通过用户名查找所有数据
	public boolean addData(Data data);                                          //添加数据
	public List<Data> getDataByDate(String name,long beginTime,long endTime);   //通过时间查找数据
	public ArrayList<DataEchats> getDataEchats(String name);
	
	public ArrayList<DataEchats> getDataEchatsByDate(String name,long beginTime,long endTime);

}

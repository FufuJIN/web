<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="https://code.jquery.com/jquery.js"></script>
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script src="/js/bootstrap/3.3.6/bootstrap.min.js"></script> 
	<script src="echarts.min.js"></script>
    <script src="/js/jquery/2.0.0/jquery.min.js"></script>
    <script src="westeros.js"></script>      
</head>
  
    <%out.println("Your IP address is " + request.getRemoteAddr());%>
    <div id="main" style="width: 600px;height:400px;float:right bottom;"></div>
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var dates = new Array(), SPO2 = new Array();
        //获取数据的函数
        function drawEcharts(){
        	$.ajax({
                type : "post",
                async : false,
                url : "/show/servletEcharts",
                data : {},
                dataType : "json", 
                success : function(result) {
                    if (result) {
                            //option.xAxis[0].data=[];
                            for(var i=0;i<result.length;i++){
                              dates.push(result[i].name);
                            }
                            //option.series[0].data=[];
                            for(var i=0;i<result.length;i++){
                              SPO2.push(result[i].num);
                            }
                     }

                  }
                
      });
     	 //20s定时刷新
         setInterval(function () { //每20秒刷新一次请求
  		   $.ajax({
  				type : "post",
  				async : false, //必须设置为false，才能实现data的全局变量赋值
  				url : "/show/servletEcharts", 
  				dataType : "json", 
  				success : function(result) {
  					 if(result){
  						if(dates.length<result.length){
  							for(var i=dates.length;i<result.length;i++){
  								dates.push(result[i].name);
  							}

	                        for(var i=SPO2.length;i<result.length;i++){
	                             SPO2.push(result[i].num);
	                        }
  						}
  					 }
  				}
  			});
         }, 1000); 
        return dates,SPO2;
      }
      
      //获取option的函数
      function getSPO2option(dates,SPO2){
    	  return {
    		//为图表添加标题
              title: {
                  text: 'ECharts 入门示例'
              },
              //配置提示信息
              tooltip: {
                          show: true
                      },
              //不同系列的标记(symbol)，颜色和名字
              legend: {
                  data:['SPO2']
              },
              //X轴
              xAxis: {
              	type: 'category',
                  data: dates
              },
              //Y轴
              yAxis: {},
              //每个系列通过 type 决定自己的图表类型:
              series: [
                  {name: '销量',
                  type: 'line',
                  data: SPO2},
              ]
          };  	  
      }
      drawEcharts();
      var SPO2option=getSPO2option(dates,SPO2); 
      var myChart = echarts.init(document.getElementById('main'),'westeros'); 
      myChart.setOption(SPO2option);
      setInterval(function () {
    	  myChart.dispose();
          $("#main").html("");
          myChart = echarts.init(document.getElementById('main'),'westeros'); 
          myChart.setOption(SPO2option);
      }, 8000); 
    </script>
    <table class="dataTable">
  <form action="/show/servletGetData" method="post"> 
  <tr>
     <td>用户名</td>
     <td>SPO2</td>  
     <td>PR</td>
     <td><input type="submit" value="更新"/></td>
  </tr>
  </form> 
  
  <c:forEach var="D" items="${dataAll}"> 
  <form action="/show/servletGetData" method="post"> 
     <tr>
        <td><input type="text" value="${D.userName}" name="username"></td>
        <td><input type="text" value="${D.SPO2}" name="spo2"></td> 
        <td><input type="text" value="${D.PR}" name="pr"></td>
        <td><input type="submit" value="更新"/></td>
       </tr>
     </form>
   </c:forEach> 
  </table>




 


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>主页</title>
<link href="/show/js/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="echarts.min.js"></script>
<script src="westeros.js"></script>  
<script src="/show/js/bootstrap/3.3.6/bootstrap.min.js"></script>
<script src="/show/js/jquery/2.0.0/jquery.min.js"></script>

<style>

a{
    color:#999;
}
.redColor{
    color: #C40000 !important;
}
nav.top{
    background-color: #f2f2f2;
    padding-top: 5px;
    padding-bottom: 5px;
    border-bottom:1px solid  #e7e7e7;
}
nav.top span, nav.top a{
    color: #999;
    margin: 0px 10px 0px 10px;
}
nav.top a:hover{
    color: #C40000;
    text-decoration: none;
}

#title{
    color:blue;
    text-align:center;
    height:100px;
}
#content {
    margin-left:25%;
    padding:1px 16px;
    height:500px;
}
#footer{
    clear:both;
    text-align:center;
}
	*{margin: 0;padding: 0}
	body{font-size: 20px;font-family: "宋体","微软雅黑";}
	ul,li{list-style: none;}
	a:link,a:visited{text-decoration: none;color: #fff;}
	.list{width: 210px;border-bottom:solid 1px #316a91;margin:0 auto 0 auto;float:left;}
	.list ul li{background-color:#467ca2; border:solid 1px #316a91; border-bottom:0;margin-top:0px;}
	.list ul li a{padding-left: 10px;color: #fff; font-size:12px; display: block; font-weight:bold; height:36px;line-height: 36px;position: relative;
	}
	.list ul li .inactive {}
	.list ul li .inactives{} 
	.list ul li ul{display: none;}
	.list ul li ul li { border-left:0; border-right:0; background-color:#6196bb; border-color:#467ca2;}
	.list ul li ul li ul{display: none;}
	.list ul li ul li a{ padding-left:20px;}
	.list ul li ul li ul li { background-color:#d6e6f1; border-color:#6196bb; }
	.last{ background-color:#d6e6f1; border-color:#6196bb; }
	.list ul li ul li ul li a{ color:#316a91; padding-left:30px;}
	
	
	.list ul li ul li a:hover{ background-color:#3CB371;}
	.active{ background-color:#008000;}
	
	.glyphicon-plus{float : right ;text-align:center;line-height:36px;}
	.glyphicon-minus{float : right ;text-align:center;line-height:36px;}
</style>
</head>
<body>
<script>
$(document).ready(function() {
	$('.inactive').click(function(){
		if($(this).siblings('ul').css('display')=='none'){
			//$(this).addClass('inactives');
			$(this).siblings('ul').slideDown(100).children('li');
			$(this).find('span').removeClass('glyphicon-plus');
			$(this).find('span').addClass('glyphicon-minus');
		
		}else{
			//$(this).removeClass('inactives');
			$(this).siblings('ul').slideUp(100);
			$(this).find('span').removeClass('glyphicon-minus');
			$(this).find('span').addClass('glyphicon-plus');
			//$(this).find('span').toggleClass('glyphicon glyphicon-plus');
			
		}
	})
});
</script>
    
    
     <nav class="top ">
        <a href="#nowhere">
            <span class="glyphicon glyphicon-home redColor"></span>
           健康首页
        </a> 
            
        <span>嗨，欢迎您的到来</span>
            <a href="#nowhere" name="loginMsg" id="loginMsg">登陆成功</a>
            <a href="#nowhere" name="msg" id="msg"><%=session.getAttribute("uname") %>,欢迎你的到来！</a> 
      
        <span class="pull-right">
            <a href="#nowhere">我的数据</a>
            <a href="#nowhere">
            <span class=" glyphicon glyphicon-shopping-cart redColor" ></span>
            数据表<strong>0</strong>张</a>       
        </span>
            
     </nav>
     <div id="all">
         <!--网页标题-->
         <div id="title">
             <h1 class="title">血氧仪配套服务</h1> 
         </div>
         <!--网页导航-->
	          <div id="menu">
	             <div class="list">
					<ul class="yiji">
						<li><a href="/show/learn.jsp" class='active'>首页</a></li>
						<li><a href="#" class="inactive" id='location_menu'>数据中心<span class="glyphicon glyphicon-plus" style='float:right bottom;'></span></a>
							<ul style="display:none">
							    <li><a href="/show/selectByDate.jsp" >查询数据</a></li> 
								<li class="last"><a href="#">导出数据</a></li>
							</ul>
						</li>
			 
						<li><a href="#" class="inactive">系统说明<span class="glyphicon glyphicon-plus"></span></a>
							<ul style="display: none">
								<li><a href="/show/introduce.jsp" class="inactive">app使用说明</a></li> 
								<li><a href="/show/introduceweb.jsp" class="inactive">网页说明</a></li>
								<li class="last"><a href="#">注意事项</a></li>
							</ul>
						</li>
			 
			 
						<li><a href="#" class="inactive">更多功能<span class="glyphicon glyphicon-plus"></span></a>
							<ul style="display: none">
								<li><a href="#" class="inactive ">血氧饱和度介绍</a>	
								</li>
								<li><a href="#" class="inactive ">仪器使用说明</a>	
								</li>
								<li class="last"><a href="#">留言意见箱</a></li>
							</ul>
						</li>
					</ul>
				</div>
	     </div>
         <!--网页内容-->
         <div id="content">
             <div id="main" style="width: 900px;height:450px;float:right bottom;"></div>
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var dates = new Array(), SPO2 = new Array(),PR = new Array();
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
                              dates.push(result[i].name.replace(' ','\n'));
                            }
                            //option.series[0].data=[];
                            for(var i=0;i<result.length;i++){
                              SPO2.push(result[i].numSPO2);
                            }
                            for(var i=0;i<result.length;i++){
                                PR.push(result[i].numPR);
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
  								dates.push(result[i].name.replace(' ','\n'));
  							}

	                        for(var i=SPO2.length;i<result.length;i++){
	                             SPO2.push(result[i].numSPO2);
	                        }
	                        for(var i=PR.length;i<result.length;i++){
                                PR.push(result[i].numPR);
                            }
  						}
  					 }
  				}
  			});
         }, 1000); 
        return dates,SPO2,PR;
      }
      
      //获取option的函数
      function getSPO2option(dates,SPO2,PR){
    	  return {
    		//为图表添加标题
              title: {
                  text: 'SPO2数据图',
                  subtext:'所有数据',
                  x:'left',
                  y:'top',
                  textAlign:'left'
              },
              //配置提示信息
              tooltip: {
                          show: true,
                          axisPointer: {
                              type: 'cross'
                          }
                      },
              //配置工具箱
              toolbox: {
            	    show: true,
			        feature: {
			        	dataView: { //数据视图
	                        show: true
	                    },
			        	//数据缩放视图
			            dataZoom: {
			            	show: true,
			                yAxisIndex: 'none'
			            },
			            //重置
			            restore: {},
			          //保存图片
			            saveAsImage: {}
			        }
			   },
              //不同系列的标记(symbol)，颜色和名字
              legend: {
            	  x:'center',
                  y:'top',
                  data:['SPO2','PR']
              },
              //X轴
              xAxis: {
              	type: 'category',
                  data: dates
              },
              //Y轴
              yAxis: {min: 0, max: 200},
          
              //
              dataZoom: [{
                  id: 'dataZoomX',
                  type: 'slider',
                  xAxisIndex: [0],
                  filterMode: 'empty', // 设定为 'filter' 从而 X 的窗口变化会影响 Y 的范围。
                  start: 0,
                  end: 100
              },
              
              {
                  type: 'inside',
                  xAxisIndex: [0],
                  filterMode: 'empty',
                  start: 0,
                  end: 100
              },
              {
                  id: 'dataZoomY',
                  type: 'slider',
                  yAxisIndex: [0],
                  filterMode: 'empty', // 设定为 'filter' 从而 X 的窗口变化会影响 Y 的范围。
                  start: 20,
                  end: 80
              },
              
              {
                  type: 'inside',
                  yAxisIndex: [0],
                  filterMode: 'empty',
                  start: 20,
                  end: 80
              }
              ],
              //每个系列通过 type 决定自己的图表类型:
              series: [
                  {name: 'SPO2',
                  type: 'line',
                  markPoint: {
                	  symbol :'pin',
                      data: [
                          {type: 'max', name: '最大值' },
                          {type: 'min', name: '最小值'}
                      ]
                  },
                  markLine: {
                      data: [
                          {type: 'average', name: '平均值'}
                      ]
                  },
                  data: SPO2},
                  {name: 'PR',
                   type: 'line',
                   markPoint: {
                	  
                	   symbol :'arrow',
                	   symbolSize : 50,
                       data: [
                           {type: 'max', name: '最大值'},
                           {type: 'min', name: '最小值'}
                       ]
                   },
                   markLine: {
                       data: [
                           {type: 'average', name: '平均值'}
                       ]
                   },
                   data: PR},
              ]
          };  	  
      }
      drawEcharts();
      var SPO2option=getSPO2option(dates,SPO2,PR); 
      var myChart = echarts.init(document.getElementById('main'),'westeros'); 
      myChart.setOption(SPO2option);
      setInterval(function () {
    	  //myChart.dispose();//销毁实例
          //$("#main").html("");
          myChart = echarts.init(document.getElementById('main'),'westeros'); 
          myChart.setOption(SPO2option);
      }, 8000); 
    </script>
         </div>
         <div id="footer">
              <b>本科毕业设计</b>
         </div>
         
    </div>

</body>
</html>
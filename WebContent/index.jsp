<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ECharts</title>
    <!-- 引入 echarts.js -->
    <script src="echarts.min.js"></script>
    <script src="/js/jsfile/EchartsExample.js"></script>
    <script src="/js/jquery/2.0.0/jquery.js"></script>
    <script src="westeros.js"></script>
</head>
<body>
    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <%out.println("Your IP address is " + request.getRemoteAddr());%>
    <div id="main" style="width: 600px;height:400px;"></div>
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var data = [Math.random()*150];
        alert(data);
        var myChart = echarts.init(document.getElementById('main'),'westeros');

        // 指定图表的配置项和数据
        var option = {
        	//为图表添加标题
            title: {
                text: 'ECharts 入门示例'
            },
            //配置提示信息
            tooltip: {},
            //不同系列的标记(symbol)，颜色和名字
            legend: {
                data:['销量','价格']
            },
            //X轴
            xAxis: {
                data: []
            },
            //Y轴
            yAxis: {},
            //每个系列通过 type 决定自己的图表类型:
            series: [
                {name: '销量',
                type: 'line',
                data: []},
                {name: '价格',
                type: 'line',
                data: []}
            ]
        };
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
        
        function drawEcharts(option){
        	$.ajax({
                type : "post",
                async : false,
                url : "/test/ServletSearchAll",
                data : {},
                dataType : "json", 
                success : function(result) {
                    if (result) {
                            option.xAxis[0].data=[];
                            for(var i=0;i<result.length;i++){
                              option.xAxis[0].data.push(result[i].name);
                            }
                            option.series[0].data=[];
                            for(var i=0;i<result.length;i++){
                              option.series[0].data.push(result[i].num);
                            }
                     }
                  }
      });    
        }
    </script>
   
</body>
</html>
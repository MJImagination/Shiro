<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

    <script type="text/javascript" src="<%=basePath%>/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/Echart/echarts.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/Echart/demo1.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/Echart/demo2.js"></script>

</head>
<body>

<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<button onclick='getData("<%=request.getContextPath()%>" + "/echar/getHistogram")'>加载数据1</button>
<div id="main" style="width: 600px;height:400px;"></div>

<button onclick='getData2("<%=request.getContextPath()%>" + "/echar/getHistogram2")'>加载数据2</button>
<div id="main2" style="width: 600px;height:400px;"></div>



</body>
</html>

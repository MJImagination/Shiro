<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <script src="<%=request.getContextPath()%>/js/jquery-1.8.3.min.js"></script>
</head>
<body>
loginName: <input type="text" id="loginName"><br><br>
password: <input type="password" id="password"><br><br>
<button id="loginbtn">登录</button>
</body>
<script type="text/javascript">
    $('#loginbtn').click(function() {
        var param = {
            loginName : $("#loginName").val(),
            password : $("#password").val()
        };
        $.ajax({
            type: "post",
            url: "<%=request.getContextPath()%>" + "/login/user",
            data: param,
            dataType: "text",
            success: function(data) {
                if(data.success == false){
                    alert("success"+data.errorMsg);
                }else{
                    //登录成功
                    window.location.href = "<%=request.getContextPath()%>" +  "/user/index";
                }
            },
            error: function(data) {
                console.log(data);
                alert("errr调用失败...."+ data);
            }
        });
    });
</script>
</html>
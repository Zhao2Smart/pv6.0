<html>
<head>
    <meta charset="UTF-8">
    <title>登录页面</title>
    <link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<form method="post" style="width: 30em; margin: auto; margin-top: 150px;">
    <h3>用户登录</h3>
    <div class=" input-group input-group-md">
              <span class="input-group-addon" id="sizing-addon1">
                  <i class="glyphicon glyphicon-user"></i></span>
        <input class="form-control" id="username" type="text" name="username" placeholder="请输入账号">
    </div>
    <br>
    <div class="input-group input-group-md">
              <span class="input-group-addon" id="sizing-addon2">
                  <i class="glyphicon glyphicon-lock"></i></span>
        <input class="form-control" id="password" type="password" name="password" placeholder="请输入密码">
    </div>
    <br>
    <div>
        <span style="color: red">${msg}</span>
    </div>
    <#--<a href="/register">没有账号？点击注册</a>-->
    <div>
        <button type="submit" id="bn" class="btn btn-success btn-block">登录</button>
    </div>

</form>
</body>
</html>
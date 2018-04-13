<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:54:"/var/www/blog/public/../app/admin/view/login/login.tpl";i:1522587829;}*/ ?>

<!DOCTYPE html>
<html lang="en" class="bg-dark">
<head>
    <meta charset="utf-8" />
    <title>潇欢博客管理后台</title>
    <meta name="description"content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
    <link href="__STATIC__/admin/bootstrap-3.3.0-dist/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="__STATIC__/admin/admin.ui/css/animate.css" type="text/css"/>
    <link rel="stylesheet" href="__STATIC__/admin/admin.ui/css/app.css" type="text/css"/>
</head>
<body class="">
<section id="content" class="m-t-lg wrapper-md animated fadeInUp">
    <div class="container aside-xxl">
        <a class="navbar-brand block" href="">潇欢博客管理后台</a>
        <section class="panel panel-default bg-white m-t-lg">
            <header class="panel-heading text-center">
                <strong>潇欢博客管理后台</strong>
            </header>
            <form method="post" action="" class="panel-body wrapper-lg">
                <div class="form-group">
                    <label class="control-label">用户名</label>
                    <input type="text" class="form-control input-lg" name="admin_name">
                </div>
                <div class="form-group">
                    <label class="control-label">密码</label>
                    <input  type="password"  class="form-control input-lg" name="admin_password">
                </div>
                <div class="form-group">
                    <label class="control-label">验证码</label>
                   <img src="<?php echo captcha_src(); ?>" alt="captcha" onclick="this.src=this.src+'?'+Math.random()">
                    <input type="text"  class="form-control input-lg col-md-6" name="code">
                    
                </div>
                <button type="submit" class="btn btn-primary">登陆</button>
            </form>
        </section>
    </div>
</section>
<!-- footer -->
<footer id="footer">
    <div class="text-center padder">
        <p>
            <small>Powered By houdunwang.com<br> copyright &copy; 2017</small>
        </p>
    </div>
</footer>
<script src="./admin.ui/js/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="./admin.ui/js/bootstrap.js"></script>
<!-- App -->
<script src="./admin.ui/js/app.js"></script>
<script src="./admin.ui/js/slimscroll/jquery.slimscroll.min.js"></script>
<script src="./admin.ui/js/app.plugin.js"></script>
</body>
</html>
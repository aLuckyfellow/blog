<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:56:"/var/www/blog/public/../app/admin/view/article/index.tpl";i:1522591213;s:47:"/var/www/blog/public/../app/admin/view/base.tpl";i:1523543526;}*/ ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>潇欢博客后台管理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link href="__STATIC__/admin/bootstrap-3.3.0-dist/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="__STATIC__/admin/css/site.css" rel="stylesheet">
    <link href="__STATIC__/admin/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="__STATIC__/admin/js/jquery.min.js"></script>
    <script src="__STATIC__/admin/bootstrap-3.3.0-dist/dist/js/bootstrap.min.js"></script>
  
    <style>
        i {
            color: #337ab7;
        }
    </style>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="__STATIC__/admin/umeditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="__STATIC__/admin/umeditor/third-party/jquery.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="__STATIC__/admin/umeditor/umeditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="__STATIC__/admin/umeditor/umeditor.min.js"></script>
    <script type="text/javascript" src="__STATIC__/admin/umeditor/lang/zh-cn/zh-cn.js"></script>
    <script type="text/javascript" src="__STATIC__/admin/ckeditor/ckeditor.js"></script>
    <style type="text/css">
        h1{
            font-family: "微软雅黑";
            font-weight: normal;
        }
        .btn {
            display: inline-block;
            *display: inline;
            padding: 4px 12px;
            margin-bottom: 0;
            *margin-left: .3em;
            font-size: 14px;
            line-height: 20px;
            color: #333333;
            text-align: center;
            text-shadow: 0 1px 1px rgba(255, 255, 255, 0.75);
            vertical-align: middle;
            cursor: pointer;
            background-color: #f5f5f5;
            *background-color: #e6e6e6;
            background-image: -moz-linear-gradient(top, #ffffff, #e6e6e6);
            background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#ffffff), to(#e6e6e6));
            background-image: -webkit-linear-gradient(top, #ffffff, #e6e6e6);
            background-image: -o-linear-gradient(top, #ffffff, #e6e6e6);
            background-image: linear-gradient(to bottom, #ffffff, #e6e6e6);
            background-repeat: repeat-x;
            border: 1px solid #cccccc;
            *border: 0;
            border-color: #e6e6e6 #e6e6e6 #bfbfbf;
            border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
            border-bottom-color: #b3b3b3;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            border-radius: 4px;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff', endColorstr='#ffe6e6e6', GradientType=0);
            filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
            *zoom: 1;
            -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
            -moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
            box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
        }

        .btn:hover,
        .btn:focus,
        .btn:active,
        .btn.active,
        .btn.disabled,
        .btn[disabled] {
            color: #333333;
            background-color: #e6e6e6;
            *background-color: #d9d9d9;
        }

        .btn:active,
        .btn.active {
            background-color: #cccccc \9;
        }

        .btn:first-child {
            *margin-left: 0;
        }

        .btn:hover,
        .btn:focus {
            color: #333333;
            text-decoration: none;
            background-position: 0 -15px;
            -webkit-transition: background-position 0.1s linear;
            -moz-transition: background-position 0.1s linear;
            -o-transition: background-position 0.1s linear;
            transition: background-position 0.1s linear;
        }

        .btn:focus {
            outline: thin dotted #333;
            outline: 5px auto -webkit-focus-ring-color;
            outline-offset: -2px;
        }

        .btn.active,
        .btn:active {
            background-image: none;
            outline: 0;
            -webkit-box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
            -moz-box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
            box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
        }

        .btn.disabled,
        .btn[disabled] {
            cursor: default;
            background-image: none;
            opacity: 0.65;
            filter: alpha(opacity=65);
            -webkit-box-shadow: none;
            -moz-box-shadow: none;
            box-shadow: none;
        }
    </style>
</head>
<body>
<div class="container-fluid admin-top">
    <!--å¯¼èˆª-->
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <h4 style="display: inline;line-height: 50px;float: left;margin: 0px"><a href="index.html" style="color: white;margin-left: -14px">潇欢博客后台管理</a>
                </h4>
                <div class="navbar-header">
                    <ul class="nav navbar-nav">
                        <li>
                            <a href="http://www.kancloud.cn/manual/thinkphp5/118003" target="_blank"><i class="fa fa-w fa-file-code-o"></i>
                                tp5文档</a>
                        </li>
                        <li>
                            <a href="http://fontawesome.dashgame.com/" target="_blank"><i
                                    class="fa fa-w fa-hand-o-right"></i> 图标库</a>
                        </li>
                        <li>
                            <a href="http://blog.qq.com/index.php" target="_blank"><i class="fa fa-w fa-forumbee"></i> 博客首页</a>
                        </li>
                    </ul>
                </div>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">
                            <i class="fa fa-w fa-user"></i>
                            <?php echo session('admin.admin_name'); ?>
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="<?php echo url('admin/entry/pass'); ?>">修改密码</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="<?php echo url('admin/entry/logout'); ?>">退出</li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!--å¯¼èˆªend-->
</div>
<!--ä¸»ä½“-->
<div class="container-fluid admin_menu">
    <div class="row">
        <div class="col-xs-12 col-sm-3 col-lg-2 left-menu">
            <div class="panel panel-default" id="menus">
                <!--æ ç›®ç®¡ç†-->
                <div class="panel-heading" role="button" data-toggle="collapse" href="#collapseExample"
                     aria-expanded="false" aria-controls="collapseExample"
                     style="border-top: 1px solid #ddd;border-radius: 0%">
                    <h4 class="panel-title">文章分类</h4>
                    <a class="panel-collapse" data-toggle="collapse" href="#collapseExample" aria-expanded="true">
                        <i class="fa fa-chevron-circle-down"></i>
                    </a>
                </div>
                <ul class="list-group menus collapse in" id="collapseExample">
                    <a href="<?php echo url('admin/category/index'); ?>" class="list-group-item">
                        <i class="fa fa-certificate" aria-hidden="true"></i>
                        <span class="pull-right" href="<?php echo url('admin/category/index'); ?>"></span>
                        分类管理
                    </a>
                </ul>
                <!--æ ç›®ç®¡ç† end-->

                <!--æ ‡ç­¾ç®¡ç†-->
                <div class="panel-heading" role="button" data-toggle="collapse" href="#collapseExample2"
                     aria-expanded="false" aria-controls="collapseExample">
                    <h4 class="panel-title">文章标签</h4>
                    <a class="panel-collapse" data-toggle="collapse" href="#collapseExample2" aria-expanded="true">
                        <i class="fa fa-chevron-circle-down"></i>
                    </a>
                </div>
                <ul class="list-group menus collapse in" id="collapseExample2">
                    <a href="<?php echo url('admin/tag/index'); ?>" class="list-group-item">
                        <i class="fa fa-tags" aria-hidden="true"></i>
                        <span class="pull-right" href=""></span>
                        标签管理
                    </a>
                   
                </ul>
                <!--æ ‡ç­¾ç®¡ç† end-->

                <!--æ–‡ç« ç®¡ç†-->
                <div class="panel-heading" role="button" data-toggle="collapse" href="#collapseExample3"
                     aria-expanded="false" aria-controls="collapseExample">
                    <h4 class="panel-title">文章管理</h4>
                    <a class="panel-collapse" data-toggle="collapse" href="#collapseExample3" aria-expanded="true">
                        <i class="fa fa-chevron-circle-down"></i>
                    </a>
                </div>
                <ul class="list-group menus collapse in" id="collapseExample3">
                    <a href="<?php echo url('admin/article/index'); ?>" class="list-group-item">
                        <i class="fa fa-drivers-license-o" aria-hidden="true"></i>
                        <span class="pull-right" href=""></span>
                        文章列表
                    </a>
                    <a href="<?php echo url('admin/article/recycle'); ?>" class="list-group-item">
                        <i class="fa fa-recycle" aria-hidden="true"></i>
                        <span class="pull-right" href=""></span>
                        回收站
                    </a>
                  
                </ul>
                <!--æ–‡ç« ç®¡ç†end-->

                <!--å‹é“¾ç®¡ç†-->
                <div class="panel-heading" role="button" data-toggle="collapse" href="#collapseExample4"
                     aria-expanded="false" aria-controls="collapseExample">
                    <h4 class="panel-title">友链</h4>
                    <a class="panel-collapse" data-toggle="collapse" href="" aria-expanded="true">
                        <i class="fa fa-chevron-circle-down"></i>
                    </a>
                </div>
                <ul class="list-group menus collapse in" id="collapseExample4">
                    <a href="<?php echo url('admin/link/index'); ?>" class="list-group-item">
                        <i class="fa fa-exchange" aria-hidden="true"></i>
                        <span class="pull-right" href=""></span>
                        友链管理
                    </a>
                </ul>
                <!--å‹é“¾ç®¡ç† end-->

                <div class="panel-heading" role="button" data-toggle="collapse" href="#collapseExample5"
                     aria-expanded="false" aria-controls="collapseExample">
                    <h4 class="panel-title">网站管理</h4>
                    <a class="panel-collapse" data-toggle="collapse" href="#collapseExample5" aria-expanded="true">
                        <i class="fa fa-chevron-circle-down"></i>
                    </a>
                </div>
                <ul class="list-group menus collapse in" id="collapseExample5">
                    <a href="<?php echo url('admin/link/web_config'); ?>" class="list-group-item">
                        <i class="fa fa-wrench" aria-hidden="true"></i>
                        <span class="pull-right" href=""></span>
                        网站配置
                    </a>
                </ul>


            </div>
        </div>
        <!--å³ä¾§ä¸»ä½“åŒºåŸŸéƒ¨åˆ† start-->
        <div class="col-xs-12 col-sm-9 col-lg-10">
             
   <ol class="breadcrumb" style="background-color: #f9f9f9;padding:8px 0;margin-bottom:10px;">
                <li>
                    <a href=""><i class="fa fa-cogs"></i>
                        文章管理</a>
                </li>
                <li class="active">
                    <a href="">文章添加 </a>
                </li>
            </ol>
            <ul class="nav nav-tabs" role="tablist">
                <li class="active"><a href="<?php echo url('admin/article/index'); ?>">文章列表</a></li>
                <li><a href="<?php echo url('admin/article/store'); ?>">文章添加</a></li>
            </ul>
            <form action="" method="post">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th width="5%">编号</th>
                                <th>文章题目</th>
                                <th>文章作者</th>
                                <th width="5%">排序</th>
                                <th>所属分类</th>
                                <th>发表时间</th>
                                <th width="200">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                                <?php if(is_array($arcAll) || $arcAll instanceof \think\Collection || $arcAll instanceof \think\Paginator): if( count($arcAll)==0 ) : echo "" ;else: foreach($arcAll as $key=>$vo): ?>
                                <tr>
                                    <td><?php echo $vo['arc_id']; ?></td>                                   
                                    <td><?php echo $vo['arc_title']; ?></td>
                                    <td><?php echo $vo['arc_author']; ?></td>
                                    <td>
                                        <input type="text" style="padding: 2px;"  class="form-control" value="<?php echo $vo['arc_sort']; ?>" onblur="chageSort(this,<?php echo $vo['arc_id']; ?>)">
                                    </td>
                                    <td><?php echo $vo['cate_name']; ?></td>
                                    <td><?php echo $vo['sendtime']; ?></td>
                                    <td>
                                        <div class="btn-group">
                                            <button data-toggle="dropdown" class="btn btn-primary btn-xs dropdown-toggle">操作<span class="caret"></span></button>
                                            <ul class="dropdown-menu dropdown-menu-right">
                                                <li><a href="<?php echo url('admin/article/edit',['arc_id'=>$vo['arc_id']]); ?>">编辑</a></li>
                                                <li class="divider"></li>
                                                <li><a href="<?php echo url('admin/article/recycle',['arc_id'=>$vo['arc_id']]); ?>">删除到回收站</a></li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                <?php endforeach; endif; else: echo "" ;endif; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </form>
            <div class="pagination pagination-sm pull-right">
               <?php echo $arcAll->render(); ?>   
            </div>
       

        </div>
    </div>
    <!--å³ä¾§ä¸»ä½“åŒºåŸŸéƒ¨åˆ†ç»“æŸ end-->
</div>
</div>
<div class="master-footer" style="margin-top: 150px">
    <a href="">勇攀高峰</a>
    <a href="">实践探索</a>
    <a href="">不断学习</a>
    <br>
    Powered by wephp v2.0 @ 2016-2022 www.baidu.com
</div>
</body>
</html>
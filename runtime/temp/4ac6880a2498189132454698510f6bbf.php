<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:54:"/var/www/blog/public/../app/index/view/index/index.tpl";i:1522647127;s:47:"/var/www/blog/public/../app/index/view/base.tpl";i:1522843531;}*/ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title><?php echo $webSet['web_name']; ?>_<?php echo $web_title['title']; ?></title>
		<!--æè¿°å’Œæ‘˜è¦?->
		<meta name="Description" content=""/>
		<meta name="Keywords" content=""/>
		<!--è½½å…¥å…¬å…±æ¨¡æ¿-->
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link rel="stylesheet" type="text/css" href="__STATIC__/index/org/bootstrap-3.3.5-dist/css/bootstrap.min.css" />
		<script src="__STATIC__/index/js/jquery-1.11.3.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="__STATIC__/index/org/bootstrap-3.3.5-dist/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" type="text/css" href="__STATIC__/index/css/index.css" />
		<link rel="stylesheet" type="text/css" href="__STATIC__/index/css/backTop.css"/>
	</head>
	<body>
		<header  style="background-image:url(https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1522655720313&di=af20ee294ae0e31e7fb84868a2ac514f&imgtype=0&src=http%3A%2F%2Fimgstore.cdn.sogou.com%2Fapp%2Fa%2F100540002%2F544822.jpg);">
			<div class="container">
				<div class="row">
					<div class="col-sm-12" >
						<h1>欢迎来到<?php echo $webSet['web_name']; ?></h1>
					</div>
				</div>
			</div>
		</header>
		<nav role="navigation" class="navbar navbar-default">
			<div class="container">
				<div class="row">
					<div class="col-sm-12" >						
						<div class="collapse navbar-collapse" id="example-navbar-collapse">
							<ul class="_menu" >
								<li <?php if(!input('param.')): ?> class="_active"<?php endif; ?>><a href="<?php echo url('index/index/index'); ?>">首页</a></li>
								<?php if(is_array($cateData) || $cateData instanceof \think\Collection || $cateData instanceof \think\Paginator): if( count($cateData)==0 ) : echo "" ;else: foreach($cateData as $key=>$vo): ?>
								<li <?php if(input('param.cate_id') == $vo['cate_id']): ?> class="_active"<?php endif; ?>><a href="<?php echo url('index/Lists/index',['cate_id'=>$vo['cate_id']]); ?>"><?php echo $vo['cate_name']; ?></a></li>								
								<?php endforeach; endif; else: echo "" ;endif; ?>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</nav>
		<section>
			<div class="container">
				<div class="row">
					
					
					  



<main class="col-md-8">
						<article class="_carousel">
							<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
							  <!-- Indicators -->
							  <ol class="carousel-indicators">
							    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
							    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
							  </ol>
							
							  <!-- Wrapper for slides -->
							  <div class="carousel-inner" role="listbox">
							    <div class="item active">
							      <img src="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1522657006938&di=764f7da40af5b3a220f9c1944b3771f8&imgtype=0&src=http%3A%2F%2Fstatic.open-open.com%2Fnews%2FuploadImg%2F20170807%2F20170807164742_829.jpg">
							    </div>
							    <div class="item">
							       <img src="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1522657192537&di=5e2a004757962d8df09ed4d0b4ce2bd8&imgtype=0&src=http%3A%2F%2Fimg5.xiazaizhijia.com%2Fwalls%2F20160708%2F1440x900_2f172c09d079701.jpg">
							    </div>
							     
							  </div>
							
							  <!-- Controls -->
							  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
							    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
							  </a>
							  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
							    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
							  </a>
							</div>
						</article>
						<?php if(is_array($arcData) || $arcData instanceof \think\Collection || $arcData instanceof \think\Paginator): if( count($arcData)==0 ) : echo "" ;else: foreach($arcData as $key=>$vo): ?>
						<article>
							<div class="_head">
								<h1><?php echo $vo['arc_title']; ?></h1>
								<span>
								作者~
								<?php echo $vo['arc_author']; ?>
								</span>
								发表时间:
								<!--pubdateè¡¨â½°ç¤ºå‘å¸ƒâ½‡æ—¥æœŸ-->
								<time pubdate="pubdate" datetime="2017-1-1"><?php echo $vo['sendtime']; ?></time>
								分类
								<a href="<?php echo url('index/lists/index',['cate_id'=>$vo['cate_id']]); ?>"><?php echo $vo['cate_name']; ?></a>
							</div>
							<div class="_digest">
							<img src="<?php echo $vo['arc_img']; ?>"  class="img-responsive"/>
								<p>
									<?php echo $vo['arc_digest']; ?>
								</p>
							</div>
							<div class="_more">
								<a href="<?php echo url('index/content/index',['arc_id'=>$vo['arc_id']]); ?>" class="btn btn-default">阅读全文</a>
							</div>
							<div class="_footer">
								<i class="glyphicon glyphicon-tags">标签</i>
								<?php if(is_array($vo['tags']) || $vo['tags'] instanceof \think\Collection || $vo['tags'] instanceof \think\Paginator): if( count($vo['tags'])==0 ) : echo "" ;else: foreach($vo['tags'] as $key=>$v): ?>
								<a href="<?php echo url('index/lists/index',['tag_id'=>$v['tag_id']]); ?>"><?php echo $v['tag_name']; ?></a>,
								<?php endforeach; endif; else: echo "" ;endif; ?>
								
							</div>
						</article>
						<?php endforeach; endif; else: echo "" ;endif; ?>
					</main>
					
					
					
						<aside class="col-md-4 hidden-sm hidden-xs">
						<div class="_widget">
							<h4>潇欢博客</h4>
							<div class="_info">
								<p>养天地正气，法古今完人</p>
								<p>见贤思齐焉，听闻过则喜</p>
								<p>
									<i class="glyphicon glyphicon-volume-down"></i>
									<a href="http://www.swoole.com" target="_blank">Swoole</a>
								</p>
							</div>
						</div>
						<div class="_widget">
							<h4>全部分类</h4>
							<div>
								<?php if(is_array($allCate) || $allCate instanceof \think\Collection || $allCate instanceof \think\Paginator): if( count($allCate)==0 ) : echo "" ;else: foreach($allCate as $key=>$vo): ?>
								<a href="<?php echo url('index/lists/index',['cate_id'=>$vo['cate_id']]); ?>"><?php echo $vo['cate_name']; ?></a>
								<?php endforeach; endif; else: echo "" ;endif; ?>
							</div>
						</div>
						<div class="_widget">
							<h4>云标签</h4>
							<div class="_tag">
								<?php if(is_array($allTag) || $allTag instanceof \think\Collection || $allTag instanceof \think\Paginator): if( count($allTag)==0 ) : echo "" ;else: foreach($allTag as $key=>$vo): ?>
								<a href="<?php echo url('index/lists/index',['tag_id'=>$vo['tag_id']]); ?>"><?php echo $vo['tag_name']; ?></a>
								
								<?php endforeach; endif; else: echo "" ;endif; ?>
							</div>
						</div>
						
					</aside>
				</div>
			</div>
		</section>
			<footer class="hidden-xs">
			<div class="container">
				<div class="row">
					<div class="col-sm-4">
						<h4 class="_title">最新文章</h4>
						<?php if(is_array($newArc) || $newArc instanceof \think\Collection || $newArc instanceof \think\Paginator): if( count($newArc)==0 ) : echo "" ;else: foreach($newArc as $key=>$vo): ?>
						<div id="" class="_single">
							<p><a href="<?php echo url('index/content/index',['arc_id'=>$vo['arc_id']]); ?>"><?php echo $vo['arc_title']; ?></a></p>
							<time><?php echo $vo['sendtime']; ?></time>
						</div>
						<?php endforeach; endif; else: echo "" ;endif; ?>
							
					</div>
					<div class="col-sm-4 footer_tag">
						<div id="">
							<h4 class="_title">云标签</h4>
							<?php if(is_array($allTag) || $allTag instanceof \think\Collection || $allTag instanceof \think\Paginator): if( count($allTag)==0 ) : echo "" ;else: foreach($allTag as $key=>$vo): ?>
							<a href="<?php echo url('index/lists/index',['tag_id'=>$vo['tag_id']]); ?>"><?php echo $vo['tag_name']; ?></a>
							<?php endforeach; endif; else: echo "" ;endif; ?>
							
						</div>
					</div>
					<div class="col-sm-4">
						<h4 class="_title">友情链接</h4>
						<div id="" class="_single">
							<?php if(is_array($webLink) || $webLink instanceof \think\Collection || $webLink instanceof \think\Paginator): if( count($webLink)==0 ) : echo "" ;else: foreach($webLink as $key=>$vo): ?>
							<p><a href="http://<?php echo $vo['link_url']; ?>" target="_blank"><?php echo $vo['link_name']; ?></a></p>
							<?php endforeach; endif; else: echo "" ;endif; ?>
							
						</div>
					</div>
				</div>
			</div>
		</footer>
		<div class="footer_bottom">
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<a href=""><?php echo $webSet['web_name']; ?></a>
						 | 
						<a href=""><?php echo $webSet['web_conypt']; ?></a>
						 |
						<a href=""><?php echo $webSet['web_melie']; ?></a>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
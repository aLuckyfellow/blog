<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>{$webSet['web_name']}_{$web_title['title']}</title>
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
						<h1>欢迎来到{$webSet['web_name']}</h1>
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
								<li {if condition="!input('param.')"} class="_active"{/if}><a href="{:url('index/index/index')}">首页</a></li>
								{foreach name='cateData' item='vo'}
								<li {if condition="input('param.cate_id') == $vo['cate_id']"} class="_active"{/if}><a href="{:url('index/Lists/index',['cate_id'=>$vo['cate_id']])}">{$vo['cate_name']}</a></li>								
								{/foreach}
							</ul>
						</div>
					</div>
				</div>
			</div>
		</nav>
		<section>
			<div class="container">
				<div class="row">
					
					
					  {block name='content'}{/block}
					
					
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
								{foreach name='allCate' item='vo'}
								<a href="{:url('index/lists/index',['cate_id'=>$vo['cate_id']])}">{$vo['cate_name']}</a>
								{/foreach}
							</div>
						</div>
						<div class="_widget">
							<h4>云标签</h4>
							<div class="_tag">
								{foreach name='allTag' item='vo'}
								<a href="{:url('index/lists/index',['tag_id'=>$vo['tag_id']])}">{$vo['tag_name']}</a>
								
								{/foreach}
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
						{foreach name='newArc' item='vo'}
						<div id="" class="_single">
							<p><a href="{:url('index/content/index',['arc_id'=>$vo['arc_id']])}">{$vo['arc_title']}</a></p>
							<time>{$vo['sendtime']}</time>
						</div>
						{/foreach}
							
					</div>
					<div class="col-sm-4 footer_tag">
						<div id="">
							<h4 class="_title">云标签</h4>
							{foreach name='allTag' item='vo'}
							<a href="{:url('index/lists/index',['tag_id'=>$vo['tag_id']])}">{$vo['tag_name']}</a>
							{/foreach}
							
						</div>
					</div>
					<div class="col-sm-4">
						<h4 class="_title">友情链接</h4>
						<div id="" class="_single">
							{foreach name='webLink' item='vo'}
							<p><a href="http://{$vo['link_url']}" target="_blank">{$vo['link_name']}</a></p>
							{/foreach}
							
						</div>
					</div>
				</div>
			</div>
		</footer>
		<div class="footer_bottom">
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<a href="">{$webSet['web_name']}</a>
						 | 
						<a href="">{$webSet['web_conypt']}</a>
						 |
						<a href="">{$webSet['web_melie']}</a>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
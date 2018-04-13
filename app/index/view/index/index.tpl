
{extend name='base' /}
{block name='content'}



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
						{foreach name='arcData' item='vo'}
						<article>
							<div class="_head">
								<h1>{$vo['arc_title']}</h1>
								<span>
								作者~
								{$vo['arc_author']}
								</span>
								发表时间:
								<!--pubdateè¡¨â½°ç¤ºå‘å¸ƒâ½‡æ—¥æœŸ-->
								<time pubdate="pubdate" datetime="2017-1-1">{$vo['sendtime']}</time>
								分类
								<a href="{:url('index/lists/index',['cate_id'=>$vo['cate_id']])}">{$vo['cate_name']}</a>
							</div>
							<div class="_digest">
							<img src="{$vo['arc_img']}"  class="img-responsive"/>
								<p>
									{$vo['arc_digest']}
								</p>
							</div>
							<div class="_more">
								<a href="{:url('index/content/index',['arc_id'=>$vo['arc_id']])}" class="btn btn-default">阅读全文</a>
							</div>
							<div class="_footer">
								<i class="glyphicon glyphicon-tags">标签</i>
								{foreach name="vo['tags']" item='v'}
								<a href="{:url('index/lists/index',['tag_id'=>$v['tag_id']])}">{$v['tag_name']}</a>,
								{/foreach}
								
							</div>
						</article>
						{/foreach}
					</main>
					{/block}
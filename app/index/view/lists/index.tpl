
{extend name='base' /}
{block name='content'}


<main class="col-md-8">
						<article>
							<div class="_head category_title">
								<h2>
										{$headData['title']}:
										
									{$headData['name']}
								</h2>
								<span>
									共有{$headData['total']}篇文章
								</span>
							</div>
						</article>
						
						{foreach name='arcData' item='vo'}
						<article>
							<div class="_head">
								<h1>{$vo['arc_title']}</h1>
								<span>
								作者
								{$vo['arc_author']}
								</span>
								
								发表时间
								<time pubdate="pubdate" datetime="">{$vo['sendtime']}</time>
								分类：
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
								<i class="glyphicon glyphicon-tags"></i>
								{foreach name="vo['tags']" item='v'}
								<a href="{:url('index/lists/index',['tag_id'=>$v['tag_id']])}">{$v['tag_name']}</a>、
								{/foreach}
								
							</div>
						</article>
						{/foreach}
					</main>
					
{/block}
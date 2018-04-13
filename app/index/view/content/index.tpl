
{extend name='base' /}
{block name='content'}



<main class="col-md-8">
						<article>
							<div class="_head">
								<h1>{$arcData['arc_title']}</h1>
								<span>
								作者：
								<a href="">{$arcData['arc_author']}</a>
								</span>
								•发表时间：
								<!--pubdate表⽰示发布⽇日期-->
								<time pubdate="pubdate">{$arcData['sendtime']}</time>
							</div>
							<div class="_digest">
								<p>
									{$arcData['arc_content']}
								</p>
							</div>
							<div class="_footer">
								<i class="glyphicon glyphicon-tags"></i>
								{foreach name="arcData['tags']" item='vo'}
								<a href="{:url('index/lists/index',['tag_id'=>$vo['tag_id']])}">{$vo['tag_name']}</a>|-
								{/foreach}
							
							</div>
						</article>
					</main>
					

{/block}
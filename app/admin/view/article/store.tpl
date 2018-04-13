
{extend name='base' /}
{block name='right'}
 <ol class="breadcrumb" style="background-color: #f9f9f9;padding:8px 0;margin-bottom:10px;">
                <li>
                    <a href=""><i class="fa fa-cogs"></i>
                        文章管理</a>
                </li>
                <li class="active">
                    <a href="">文章添加</a>
                </li>
            </ol>
            <ul class="nav nav-tabs" role="tablist">
                <li><a href="{:url('admin/article/index')}">文章列表</a></li>
                <li class="active"><a href="">文章添加</a></li>
            </ul>
            <form class="form-horizontal" id="form"  action="{:url('admin/article/addArticle')}" method="post">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">文章添加</h3>
                    </div>
                   
                   <div class="panel-body">
                        <div class="form-group">
                            <label for="" class="col-sm-2 control-label">文章标题</label>
                            <div class="col-sm-9">
                                <input type="text" name="arc_title"  class="form-control" placeholder="文章标题">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-2 control-label">文章作者</label>
                            <div class="col-sm-9">
                                <input type="text" name="arc_author"  class="form-control" placeholder="文章作者">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-2 control-label">文章分类</label>
                            <div class="col-sm-9">
                                <select class="js-example-basic-single form-control" name="cate_id" >
                                    <option value="0">顶级分类</option>
                                       {foreach name='cateDate' item='vo'}

                                        <option value="{$vo['cate_id']}">{$vo['cate_name']}</option>
                                       
                                        {/foreach}
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-2 control-label" >文章标签</label>
                            <div class="col-sm-9">
                                   {foreach name='tagDate' item='vo'}
                                   <label class="checkbox-inline">
                                        <input type="checkbox" name="tag_id[]" value="{$vo['tag_id']}"> {$vo['tag_name']}
                                    </label>
                                    {/foreach}
                                
                            </div>
                        </div>
                        <div class="form-group">
                           <label for="" class="col-sm-2 control-label">文章图片</label>
                            <div class="col-sm-9">
                                <input type="text" name="arc_img"  class="form-control" placeholder="从网络获取">

                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-2 control-label">文章摘要</label>
                            <div class="col-sm-9">
                                <textarea type="text" name="arc_digest"  class="form-control" placeholder="文章摘要"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for=""  class="col-sm-2 control-label">文章内容</label>
                            <div class="col-sm-9">
 

<textarea name="arc_content"></textarea>
<script type="text/javascript">
CKEDITOR.replace( 'arc_content' );
</script>











                        </div>
                    </div>
                </div>
                <input class="btn btn-primary" type="submit" value="确认添加"></input>
            


{/block}
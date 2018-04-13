
{extend name='base' /}
{block name='right'}
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
                <li class="active"><a href="{:url('admin/article/index')}">文章列表</a></li>
                <li><a href="{:url('admin/article/store')}">文章添加</a></li>
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
                                {foreach name='arcAll' item='vo'}
                                <tr>
                                    <td>{$vo['arc_id']}</td>                                   
                                    <td>{$vo['arc_title']}</td>
                                    <td>{$vo['arc_author']}</td>
                                    <td>
                                        <input type="text" style="padding: 2px;"  class="form-control" value="{$vo['arc_sort']}" onblur="chageSort(this,{$vo['arc_id']})">
                                    </td>
                                    <td>{$vo['cate_name']}</td>
                                    <td>{$vo['sendtime']}</td>
                                    <td>
                                        <div class="btn-group">
                                            <button data-toggle="dropdown" class="btn btn-primary btn-xs dropdown-toggle">操作<span class="caret"></span></button>
                                            <ul class="dropdown-menu dropdown-menu-right">
                                                <li><a href="{:url('admin/article/edit',['arc_id'=>$vo['arc_id']])}">编辑</a></li>
                                                <li class="divider"></li>
                                                <li><a href="{:url('admin/article/recycle',['arc_id'=>$vo['arc_id']])}">删除到回收站</a></li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                {/foreach}
                            </tbody>
                        </table>
                    </div>
                </div>
            </form>
            <div class="pagination pagination-sm pull-right">
               {$arcAll->render()}   
            </div>
       
{/block}

{extend name='base'}

{block name='right'}

      <ol class="breadcrumb" style="background-color: #f9f9f9;padding:8px 0;margin-bottom:10px;">
                <li>
                    <a href="{:url('admin/category/index')}"><i class="fa fa-cogs"></i>
                        栏目管理</a>
                </li>
                <li class="active">
                    <a href="{:url('admin/category/index')}">栏目列表</a>
                </li>
            </ol>
            <ul class="nav nav-tabs" role="tablist">
                <li class="active"><a href="">栏目列表</a></li>
                <li><a href="{:url('admin/category/addtage')}">添加栏目</a></li>
            </ul>
            <form action="" method="post">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th width="80">编号</th>
                                <th>栏目名称</th>
                                <th width="200">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            {foreach name='lanmu' key='key' item='vo'}
                                <tr>
                                    <td>{$vo['cate_id']}</td>
                                    <td>{$vo['cate_name']}</td>
                                    <td>
                                        <div class="btn-group">
                                            <button data-toggle="dropdown" class="btn btn-primary btn-xs dropdown-toggle">操作 <span class="caret"></span></button>
                                            <ul class="dropdown-menu dropdown-menu-right">
                                                <li><a href="{:url('admin/category/addSon',['cate_id'=>$vo['cate_id']])}">添加子类</a></li>
                                                <li><a href="{:url('admin/category/edit',['cate_id'=>$vo['cate_id']])}">编辑</a></li>
                                                <li class="divider"></li>
                                                <li><a href="{:url('admin/category/del',['cate_id'=>$vo['cate_id']])}">删除</a></li>
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
                 {$lanmu->render()}
            </div>


{/block}
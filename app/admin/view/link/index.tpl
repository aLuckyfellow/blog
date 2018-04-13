
{extend name='base' /}
{block name='right'}

 <ol class="breadcrumb" style="background-color: #f9f9f9;padding:8px 0;margin-bottom:10px;">
                <li>
                    <a href=""><i class="fa fa-cogs"></i>
                        友链管理</a>
                </li>
                <li class="active">
                    <a href="">友链展示</a>
                </li>
            </ol>
            <ul class="nav nav-tabs" role="tablist">
                <li class="active"><a href="">友链管理</a></li>
                <li><a href="{:url('admin/link/store')}">友链添加</a></li>
            </ul>
            <form action="" method="post">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th width="80">编号</th>
                                <th>友链名称</th>
                                <th>友链地址</th>
                                <th width="200">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            {foreach name='linkList' item='vo'}
                            <tr>
                                <td>{$vo['link_id']}</td>
                                <td>{$vo['link_name']}</td>
                                <td>{$vo['link_url']}</td>
                                <td>
                                    <div class="btn-group">
                                        <button data-toggle="dropdown" class="btn btn-primary btn-xs dropdown-toggle">操作 <span class="caret"></span></button>
                                        <ul class="dropdown-menu dropdown-menu-right">
                                            <li><a href="{:url('admin/link/store',['link_id'=>$vo['link_id']])}">编辑</a></li>
                                            <li class="divider"></li>
                                            <li><a href="{:url('admin/link/delLink',['link_id'=>$vo['link_id']])}">删除</a></li>
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
               {$linkList->render()}
            </div>




{/block}
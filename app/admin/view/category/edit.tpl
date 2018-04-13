
{extend name='base'/}

{block name='right'}
 <ol class="breadcrumb" style="background-color: #f9f9f9;padding:8px 0;margin-bottom:10px;">
                <li>
                    <a href="{:url('admin/category/index')}"><i class="fa fa-cogs"></i>
                        栏目管理</a>
                </li>
                <li class="active">
                    <a href="{:url('admin/category/edit')}">栏目编辑</a>
                </li>

            </ol>
            <ul class="nav nav-tabs" role="tablist">
                <li><a href="{:url('admin/category/index')}">栏目列表</a></li>
                <li class="active"><a href="{:url('admin/category/edit')}">栏目编辑</a></li>
            </ul>
            <form class="form-horizontal" id="form" action="" method="post">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">栏目编辑</h3>
                    </div>
                    <div class="panel-body">
                        <div class="form-group">
                            <label for="" class="col-sm-2 control-label">栏目名称</label>
                            <div class="col-sm-9">
                                <input type="text" value="{$data['cate_name']}" name="cate_name"  class="form-control" placeholder="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-2 control-label">所属分类</label>
                            <div class="col-sm-9">
                              
                                <select class="js-example-basic-single form-control" name="cate_pid">
                                    <option value="0">顶级分类</option>
                                   {foreach name='cateDate' key='key' item='vo'}
                                   <option {if condition="$data['cate_pid']==$vo['cate_id']"}selected{/if} value="{$vo['cate_id']}">{$vo['cate_name']}</option>
                                   {/foreach}
                                </select>
                               
                            </div>
                        </div>
                    
                        <div class="form-group">
                            <label for="" class="col-sm-2 control-label">栏目排序</label>
                            <div class="col-sm-9">
                                <input type="number" value="{$data['cate_sort']}" name="cate_sort"  class="form-control" placeholder="">
                            </div>
                        </div>
                    </div>
                </div>
                <input type="hidden" name="cate_id" value="{:input('param.cate_id')}">
                <button class="btn btn-primary" type="submit">确认编辑</button>
            </form>


{/block}
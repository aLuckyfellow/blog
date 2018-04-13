
{extend name='base'/}

{block name='right'}
 <ol class="breadcrumb" style="background-color: #f9f9f9;padding:8px 0;margin-bottom:10px;">
                <li>
                    <a href="{:url('admin/category/index')}"><i class="fa fa-cogs"></i>
                       栏目管理</a>
                </li>
                <li class="active">
                    <a href="{:url('admin/category/addtage')}">栏目添加</a>
                </li>

            </ol>
            <ul class="nav nav-tabs" role="tablist">
                <li><a href="{:url('admin/category/index')}">栏目列表</a></li>
                <li class="active"><a href="{:url('admin/category/addtage')}">栏目添加</a></li>
            </ul>
            <form class="form-horizontal" id="form" action="{:url('admin/category/addtage')}" method="post">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">æ ç›®ç®¡ç†</h3>
                    </div>
                    <div class="panel-body">
                        <div class="form-group">
                            <label for="" class="col-sm-2 control-label">栏目名称</label>
                            <div class="col-sm-9">
                                <input type="text" name="cate_name"  class="form-control" placeholder="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-2 control-label">栏目分类</label>
                            <div class="col-sm-9">
                              
                                <select class="js-example-basic-single form-control" name="cate_pid">
                                    <option value="{$data['cate_id']}">{$data['cate_name']}</option>
                                   
                                </select>
                               
                            </div>
                        </div>
                    
                        <div class="form-group">
                            <label for="" class="col-sm-2 control-label">栏目排序</label>
                            <div class="col-sm-9">
                                <input type="number" name="cate_sort"  class="form-control" placeholder="">
                            </div>
                        </div>
                    </div>
                </div>
                <button class="btn btn-primary" type="submit">添加</button>
            </form>


{/block}
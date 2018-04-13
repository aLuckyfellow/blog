

{extend name='base'/}
{block name='right'}

 <ol class="breadcrumb" style="background-color: #f9f9f9;padding:8px 0;margin-bottom:10px;">
                <li>
                    <a href="javascript:;"><i class="fa fa-cogs"></i>
                        密码管理</a>
                </li>
                <li class="active">
                    <a href="javascript:;">修改密码</a>
                </li>
            </ol>
            <form onsubmit="return changePass()" class="form-horizontal" id="form" action="{:url('admin/entry/pass')}" method="post">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">修改密码</h3>
                    </div>
                    <div class="panel-body">
                        <div class="form-group">
                            <label for="" class="col-sm-2 control-label">原始密码</label>
                            <div class="col-sm-9">
                                <input  type="text" name="admin_password"  class="form-control" placeholder="原始密码">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-2 control-label">新密码</label>
                            <div class="col-sm-9">
                                <input  type="text" name="new_password"  class="form-control" placeholder="新密码">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-2 control-label">确认密码</label>
                            <div class="col-sm-9">
                                <input  type="text" name="confirm_password"  class="form-control" placeholder="确认密码">
                            </div>
                        </div>
                    </div>
                </div>
                <button class="btn btn-primary" type="submit">修改</button>
            </form>

{/block}
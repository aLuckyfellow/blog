
{extend name='base' /}
{block name='right'}
 <ol class="breadcrumb" style="background-color: #f9f9f9;padding:8px 0;margin-bottom:10px;">
                <li>
                    <a href=""><i class="fa fa-cogs"></i>
                        网站管理</a>
                </li>
                <li class="active">
                    <a href="">网站配置</a>
                </li>
            </ol>
            <ul class="nav nav-tabs" role="tablist">
               
                <li class="active"><a href="">网站配置</a></li>
            </ul>
            <form class="form-horizontal" id="form"  action="{:url('admin/link/web_config')}" method="post">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">网站配置</h3>
                    </div>
                   
                   <div class="panel-body">
                        <div class="form-group">
                            <label for="" class="col-sm-2 control-label">网站名称</label>
                            <div class="col-sm-9">
                                <input type="text" value="{$data['web_name']}" name="web_name"  class="form-control" ">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-2 control-label">邮箱</label>
                            <div class="col-sm-9">
                                <input type="text" value="{$data['web_melie']}" name="web_melie"  class="form-control" >
                            </div>
                        </div>
                       
                       
                        <div class="form-group">
                           <label for="" class="col-sm-2 control-label">版权</label>
                            <div class="col-sm-9">
                                <input type="text" value="{$data['web_conypt']}"  name="web_conypt"  class="form-control">

                            </div>
                        </div>
                       
                      
                        </div>
                    </div>
                </div>
                <input class="btn btn-primary" type="submit" value="确定配置"></input>
            
<script>
      
    </form>
   

   

{/block}
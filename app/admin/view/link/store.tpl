
{extend name='base' /}
{block name='right'}

 <ol class="breadcrumb" style="background-color: #f9f9f9;padding:8px 0;margin-bottom:10px;">
                <li>
                    <a href="{:url('admin/link/index')}"><i class="fa fa-cogs"></i>
                               友链管理</a>
                </li>

                {if condition="input('param.link_id')"}
                 <li class="active">
                    <a href="">友链编辑</a>
                </li>

                 {else/}
                 <li class="active">
                    <a href="">友链添加</a>
                </li>

                 {/if}


               
            </ol>
            <ul class="nav nav-tabs" role="tablist">
                <li><a href="{:url('admin/link/index')}">友链管理</a></li>
                {if condition="input('param.link_id')"}
                  <li class="active"><a href="">友链编辑</a></li>
                {else/}

               <li class="active"><a href="">友链添加</a></li>
                {/if}

                
            </ul>
            <form class="form-horizontal" id="form"  action="{:url('admin/link/store')}" method="post">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">友链管理</h3>
                    </div>
                    <div class="panel-body">

                        <div class="form-group">
                            <label for="" class="col-sm-2 control-label">友链名称</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="link_name" value="{$oldData['link_name']}">
                            </div>
                            
                   
                            
                             <label for="" class="col-sm-2 control-label">友链地址</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="link_url" value="{$oldData['link_url']}">
                            </div>
                        
                        
                        </div>
                    </div>
                </div>
                <input type="hidden" name="link_id" value="{:input('param.link_id')}">
      
                <input class="btn btn-primary" type="submit" value="提交">
            </form>



{/block}

{extend name='base' /}
{block name='right'}

 <ol class="breadcrumb" style="background-color: #f9f9f9;padding:8px 0;margin-bottom:10px;">
                <li>
                    <a href="{:url('admin/tag/index')}"><i class="fa fa-cogs"></i>
                        标签管理</a>
                </li>

                {if condition="input('param.tag_id')"}
                 <li class="active">
                    <a href="">标签编辑</a>
                </li>

                 {else/}
                 <li class="active">
                    <a href="">标签添加</a>
                </li>

                 {/if}


               
            </ol>
            <ul class="nav nav-tabs" role="tablist">
                <li><a href="{:url('admin/tag/index')}">标签管理</a></li>
                {if condition="input('param.tag_id')"}
                  <li class="active"><a href="">标签编辑</a></li>
                {else/}

               <li class="active"><a href="">标签添加</a></li>
                {/if}

                
            </ul>
            <form class="form-horizontal" id="form"  action="" method="post">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">标签管理</h3>
                    </div>
                    <div class="panel-body">

                        <div class="form-group">
                            <label for="" class="col-sm-2 control-label">标签名称</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="tag_name" value="{$oldData['tag_name']}">
                            </div>
                        
                        
                        </div>
                    </div>
                </div>
                <input type="hidden" name="tag_id" value="{:input('param.tag_id')}">
      
                <button class="btn btn-primary" type="submit">确定</button>
            </form>



{/block}
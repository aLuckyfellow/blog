<?php
namespace app\admin\validate;

use think\Validate;

class Link extends Validate
{
	protected $rule = [
         'link_name' =>'require',
         'link_url' =>'require',
	];
	protected $message = [
         'link_name.require' => '请填写友链名称',
         'link_url.require' => '请填写友链地址',
	]; 
}
?>
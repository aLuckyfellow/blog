<?php
namespace app\admin\validate;
	
use think\Validate;


class Article extends Validate
{
	protected $rule = [
         'arc_title' =>'require',
         'arc_author'=>'require',
         'arc_digest'=>'require',
         'arc_content'=>'require',
	];
	protected $message = [
         'arc_title.require' => '请输入文章标题',
         'arc_author.require' => '请输入文章作者',
         'arc_digest.require' => '请输入文章摘要',
         'arc_content.require' =>'请输入文章内容',
	];
}

?>
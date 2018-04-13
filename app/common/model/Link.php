<?php
namespace app\common\model;

use think\Model;
use think\Validate;

class Link extends Model
{
   protected $pk = 'link_id';//主键
   protected $table = 'blog_link';
   
   public function store($data){
   	  
   	   if($data['link_id']){  //通过提交的数据判断 是添加友链   还是编辑友链
   	   	 $result = $this->validate(true)->save($data,[$this->pk=>$data['link_id']]); //编辑操作
   	   } else {
   	   	  $result = $this->validate(true)->save($data); //添加操作
   	   }
   	  
        if(false == $result){
        	return  ['valid'=>0,'msg'=>$this->getError()];
        } else {
        	return ['valid'=>1,'msg'=>'操作成功'];
        }
        
   }
   
 }
?>
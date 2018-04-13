<?php
namespace app\common\model;

use think\Model;
use think\Validate;

class Tag extends Model
{
   protected $pk = 'tag_id';//主键
   protected $table = 'blog_tag';

   public function store($data){
   	   //1.验证
   	   //2.执行添加
   	   //halt($data);exit;
   	   if($data['tag_id']){  //通过提交的数据判断 是添加标签   还是编辑标签
   	   	 $result = $this->validate(true)->save($data,[$this->pk=>$data['tag_id']]); //编辑操作
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
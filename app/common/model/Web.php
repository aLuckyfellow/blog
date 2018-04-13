<?php
namespace app\common\model;

use think\Model;

class Web extends Model
{
   protected $pk = 'web_id';//主键
   protected $table = 'blog_web';
   
   public function web_config($data){
   	   
   	   $result = $this->save($data,[$this->pk=>1]); 
   	   if(false == $result){
        	return  ['valid'=>0,'msg'=>'配置失败'];
        } else {
        	return ['valid'=>1,'msg'=>'配置成功'];
        }

   }
}
?>
<?php

namespace app\common\model;

use app\common\model\Arr;
use think\Model;
use think\Validate;

class Category extends Model
{
	protected $pk = 'cate_id';
	protected $table = 'blog_cate';

	public function store($data) {
            
           $result = $this->validate(true)->save($data);
           if(false == $result) {
           	 // dump($this->getError());
           	return ['valid'=>0,'msg'=>$this->getError()];
           } else {
           	 return ['valid'=>1,'msg'=>'添加成功'];
           }     
	}
   /*
   *获取分类数据（树状分类）
   */
   public function getAll() {
   	  // return  Arr::tree(db('cate')->order('cate_sort desc,cate_id ')->select(),'cate_name',$fieldPri = 'cate_id',$fieldPid = 'cate_pid');
//     return (new Arr)->tree(db('cate')->order('cate_sort desc,cate_id')->
//    select(), 'cate_name', $fieldPri = 'cate_id', $fieldPid = 'cate_pid');
       return db('cate')->paginate(4);

   }

   public function getCateData($cate_id){
          //halt($cate_id);
        //1.首先找到$cate_id的子级   
       $cate_ids = $this->getSon(db('cate')->select(),$cate_id);
       //halt($cate_ids);
       //2.把自己追加进去
        $cate_ids[] = $cate_id;
        //3.找到除了他们之外的数据
        $field = db('cate')->whereNotIn('cate_id',$cate_ids)->select();
        return $field;

   }

   public function getSon($data,$cate_id){
         
         static $temp = [];
         foreach($data as $k=>$v){
            if($cate_id == $v['cate_pid']){
                $temp[] = $v['cate_id'];
                $this->getSon($data,$v['cate_id']);
            }
         }
          return $temp;
   }
 
   public function edit($data){      //编辑栏目，保存修改后内容
         $result = $this->validate(true)->save($data,[$this->pk=>$data['cate_id']]);
         if($result){
            return ['valid'=>1,'msg'=>'编辑成功'];
         } else {
            return ['valid'=>0,'msg'=>'编辑失败'];
         }
   }

   public function del($cate_id){ //删除栏目
        //1.获取当前栏目的cate_pid的值 
        $cate_pid = $this->where('cate_id',$cate_id)->value('cate_pid');
        // halt($cate_pid);  
        //2.将当前要删除的$cate_id的子级数据的pid修改成$cate_pid 
        $this->where('cate_pid',$cate_pid)->update(['cate_pid'=>$cate_pid]);
        if(Category::destroy($cate_id)){
           return ['valid'=>1,'msg'=>'删除成功'];
        } else {
          
         return ['valid'=>1,'msg'=>'删除成功'];
        }
   }

}


?>
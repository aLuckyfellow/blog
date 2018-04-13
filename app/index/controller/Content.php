<?php
namespace app\index\controller;

use app\common\model\Article;
class Content extends Common
{

    public function index()
    {
    	$web_title=['title'=>'内容页'];
    	$this->assign('web_title',$web_title);
    	$arcId = input('param.arc_id');
    	
    	if($arcId){
    		//获取点击文章的内容
    		$arcData = db('article')->field('arc_id,arc_title,arc_author,arc_content,sendtime')
    		->find($arcId);
    				
    		//追加文章标签数据
    		$arcData['tags'] = db('arc_tag')->alias('at')
    		->join('__TAG__ t','at.tag_id=t.tag_id')
    		->where('at.arc_id',$arcData['arc_id'])
    		->field('t.tag_id,t.tag_name')->select();    		
    		$this->assign('arcData',$arcData);    
    	}
    	return $this->fetch();
    }
    
   
    
     
    
 
 
  
}

?>
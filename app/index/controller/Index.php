<?php

namespace app\index\controller;


class Index extends Common
{
    public function index()
    {
    	$web_title=['title'=>'首页'];
    	$this->assign('web_title',$web_title);
    	$arcData = db('article')->alias('a')
    	->join('__CATE__ c','a.cate_id=c.cate_id')
        ->order('arc_id desc')
    	->select();
    	
    	foreach($arcData as $k => $v){
    		$arcData[$k]['tags'] = db('arc_tag')->alias('at')
    		->join('__TAG__ t','at.tag_id=t.tag_id')
    		->where('at.arc_id',$v['arc_id'])->field('t.tag_id,t.tag_name')
    		->select();
    	}
    	
    	$this->assign('arcData',$arcData);
    	return $this->fetch();
    }

    public function server(){
        halt($_SERVER);

        echo "__CLASS__";
    }
    
 
 
  
}

<?php
namespace app\index\controller;

use app\common\model\Category;
class Lists extends Common
{
    public function index()
    {
    	$web_title=['title'=>'列表页'];
    	$this->assign('web_title',$web_title);
    
        //通过点击分类获取列表页
        $cate_id = input('param.cate_id');
        if($cate_id){
        	//获取左边第一部分数据（头部 的数据）
        	//当前分类所有子集分类id
        	$cids = (new Category())->getSon(db('cate')->select(),$cate_id);
        	$cids[] = $cate_id; //把自己追加进去
        	$headData = [
        	       'title' => '分类',
                   'name' => db('cate')->where('cate_id',$cate_id)->value('cate_name'),
                   'total' =>db('article')->whereIn('cate_id',$cids)->count(),       	
        	];
        	
        	//获取文章
        	$arcData = db('article')->alias('a')
        	->join('__CATE__ c','a.cate_id = c.cate_id')
        	->whereIn('a.cate_id',$cids)->select();
        	foreach($arcData as $k=>$v){
        		$arcData[$k]['tags'] = db('arc_tag')->alias('at')
        		->join('__TAG__ t','at.tag_id=t.tag_id')
        		->where('at.arc_id',$v['arc_id'])->field('t.tag_id,t.tag_name')->select();
        	}
        	
        	 $this->assign('headData',$headData);
        	 $this->assign('arcData',$arcData);
        	 
        }
        
         //通过点击标签获取列表页
         $tag_id = input('param.tag_id');
         if($tag_id){
         	$headData = [       
         	       'title'=> '标签',
                   'name' => db('tag')->where('tag_id',$tag_id)->value('tag_name'),
                   'total' =>db('arc_tag')->where('tag_id',$tag_id)->count(),
         	];
         	
         	//获取文章内容
         	$arcData = db('article')->alias('a')
         	->join('__ARC_TAG__ at','a.arc_id=at.arc_id')
         	->join('__CATE__ c','a.cate_id=c.cate_id')
            ->where('at.tag_id',$tag_id)
            ->select();
            
            foreach($arcData as $k=>$v){
        		$arcData[$k]['tags'] = db('arc_tag')->alias('at')
        		->join('__TAG__ t','at.tag_id=t.tag_id')
        		->where('at.arc_id',$v['arc_id'])->field('t.tag_id,t.tag_name')->select();
        	}
            
            $this->assign('headData',$headData);
            $this->assign('arcData',$arcData);
            
         }
         
    	return $this->fetch();
    }
    
}

?>
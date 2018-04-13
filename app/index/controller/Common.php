<?php
namespace app\index\controller;

use think\Controller;
use think\Request;
class Common extends Controller
{
    
    public function __construct( Request $request = null){
    	parent::__construct( $request );
    	//获取网站配置
    	$webSet = $this->webSet();
    	$this->assign('webSet',$webSet);
    	
    	//获取顶级栏目名称
    	$cateData = $this->cateData();
    	$this->assign('cateData',$cateData);
    	
    	//获取全部的便签名称
    	$allCate = $this->allCate();
    	$this->assign('allCate',$allCate);
    	
    	//获取标签
    	$allTag = $this->allTag();
    	$this->assign('allTag',$allTag);
    	
    	//获取最新文章
    	$newArc = $this->newArc();
    	$this->assign('newArc',$newArc);
    	
    	//获取友链
    	$webLink = $this->webLink();
    	$this->assign('webLink',$webLink);
    
    }
    
    public function webLink(){
    	return db('link')->select();
    }
    
    public function newArc(){
    	return db('article')->order('arc_id desc')->limit(2)->field('arc_id,arc_title,sendtime')->select();
    }
    
    public function allTag(){
    	return db('tag')->select();
    }
    
     public function allCate(){
    	return db('cate')->order('cate_sort desc')->select();
    }
     public function webSet(){
    	return db('web')->find();
    }
    
    public function cateData(){
    	return db('cate')->where('cate_pid',0)->limit(3)->select();
    }
    
    
}
    
?>
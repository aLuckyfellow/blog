<?php
namespace app\common\model;

use app\common\model\ArcTag;
use think\Loader;
use think\Model;
use think\Validate;


class Article extends Model
{
	protected $pk = 'arc_id';//主键
    protected $table = 'blog_article';
	
	public function addArticle($data){
		
		if(!($data['cate_id'])){
			return ['valid'=>1,'msg'=>'请选择文章分类'];
			exit;
		}
		if(!isset($data['tag_id'])){
			return ['valid'=>1,'msg'=>'请选择文章标签'];
			exit;
		}
		
		//halt($data);exit;
		 $time = ['sendtime'=>date('Y-m-d h:i:s'),
		 		  'admin_name'=>session('admin.admin_name')
		 		 ];
		 		 //halt($time);exit;
		 $article = $time + $data;
		 $result = $this->validate(true)->allowField(true)->save($article);
        if($result){
        		//添加文章标签
        	 foreach($data['tag_id'] as $v){
        	 	$tagData = [
        	 		'arc_id'=>$this->arc_id,
        	 		'tag_id'=>$v,
        	 	]; 	
        	 	(new ArcTag())->save($tagData);    
        	 }
        	     	
        	return ['valid'=>1,'msg'=>'添加成功'];
        } else {	
        	return  ['valid'=>0,'msg'=>$this->getError()];
        }

		
	}
	/*
	 *获取全部的文章数据
	 * */
	public function getAll(){
		$arcList = db('article')->alias('a')
		         ->join('__CATE__ c','a.cate_id=c.cate_id')
		         ->where('a.is_recycle',2)
		         ->order('a.arc_sort desc,a.sendtime desc,a.arc_id desc')
		         ->field('a.arc_id,a.arc_title,a.arc_author,a.sendtime,c.cate_name,a.arc_sort')->paginate(2);

		return $arcList;
	}
	 
	 /*
	 *获取回收站全部的文章数据
	 * */
	 public function getRall(){
	 	$arcList = db('article')->alias('a')
		         ->join('__CATE__ c','a.cate_id=c.cate_id')
		         ->where('a.is_recycle',1)
		         ->order('a.arc_sort desc,a.sendtime desc,a.arc_id desc')
		         ->field('a.arc_id,a.arc_title,a.arc_author,a.sendtime,c.cate_name,a.arc_sort')->paginate(2);
		         return $arcList;

	 }
	 
	 /*
	  * 知道文章的分类id 获取文章的内容
	  */
	 public function getArt($cate_id){
	 	 $arcList = db('cate')->alias('a')
		         ->join('__ARTICLE__ c','a.cate_id=c.cate_id')
		         ->where('a.cate_id',$cate_id)
		         ->field('c.arc_title,c.arc_img,c.sendtime,c.arc_author,c.arc_digest')->select();
		         return $arcList;
	 }
	 
	 /*
	  * 知道文章的id获取这篇文章的标签
	  */
	 public function getTag($arc_id){
         $tagList = db('arc_tag')->alias('a')
		         ->join('__TAG__ c','a.tag_id=c.tag_id')
		         ->where('a.arc_id',$arc_id)
		         ->field('c.tag_name,c.tag_id')->select();
		         return $tagList;
	 }
	 
	/**
	 * 修改文章排序
	 */
	public function chageSort($data){
		$this->validate([
		   'arc_sort' => 'require|between:1,9999',
		],[
		   'arc_sort.require' => '请输入排序',
		   'arc_sort.between' => '输入排序在1~9999之间',
		])->save($data,[$this->pk=>$data['arc_id']]);
	}
	
	/**
	 * 文章编辑
	 */
	public function edit($data){

		$result = $this->validate(true)->allowField(true)->save($data,[$this->pk=>$data['arc_id']]);
        if($result){
        		//编辑文章标签
        	 (new ArcTag())->where('arc_id',$data['arc_id'])->delete(); //删除原来的便签
        	 foreach($data['tag_id'] as $v){
        	 	$tagData = [
        	 		'arc_id'=>$this->arc_id,
        	 		'tag_id'=>$v,
        	 	]; 	
        	 	(new ArcTag())->save($tagData);    
        	 }
        	     	
        	return ['valid'=>1,'msg'=>'编辑成功'];
        } else {	
        	return  ['valid'=>0,'msg'=>$this->getError()];
        }

	}

}

?>
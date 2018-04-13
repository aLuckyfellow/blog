<?php
namespace app\admin\controller;

use think\Controller;
use think\Model;
use app\common\model\Category;

class Article extends Controller
{

	protected $db;
	public function __construct() {
		//实例化数据库模型类
        parent::__construct();
        $this->db = new \app\common\model\Article();
        //判断，没有登陆信息不能进入管理		
		//tp5提供的session（）函数，相当于$_SESSION['admin']['admin_id']
		if(!session('admin.admin_id')){
			$this->error('请登录后操作','admin/login/login');
		}
}
       public function index(){
          
          $all = $this->db->getAll();
          
          //halt($all);exit;
          $this->assign('arcAll',$all);
       	  return $this->fetch();
       }

       public function store(){   //文章添加

       	//获取文章分类
       	 $cateDate = (new Category)->getAll();
       	 //halt($cateDate);
       	 $this->assign('cateDate',$cateDate);
       	 //获取标签数据
       	 $tagDate = db('tag')->select();
       	 $this->assign('tagDate',$tagDate);
       	
       	 return $this->fetch();
       }
       
       public function addArticle(){    	 
   	     
   	     if(request()->isPost()){
  	 	 
  	 	 $res = $this->db->addArticle(input('post.'));
  	 	  
  	 	 if($res['valid']){
	    		//说明添加成功
	    		$this->success($res['msg'],'admin/article/index');exit();
	    	} else {
	    		//说明添加失败
	    		$this->error($res['msg']);exit();
	    	}
   	 }

        
       }
       
       /***
        * 修改排序
        */
       public function chageSort(){
       	
       	if(request()->isAjax){
       		$res = $this->db->chageSort(inout('post.'));
       	}
       }
       
       /**
        * 编辑文章
        */
       public function edit(){
         
         if(request()->isPost()){
         	$res = $this->db->edit(input('post.'));
         	if($res['valid']){
         		$this->success($res['msg'],'admin/article/index');exit();
         	} else {
         		//编辑失败
         		$this->error($res['msg']);exit();
         	}
         }
         
         
        $arc_id = input('param.arc_id');
        //获取文章分类数据
        $cateData = (new Category())->getAll();
        $this->assign('cateData',$cateData);
        //获取标签数据
        $tagData = db('tag')->select();
        $this->assign('tagData',$tagData);
        //获取文章所有标签id
        $tag_dis = db('arc_tag')->where('arc_id',$arc_id)->column('tag_id'); //tp5中column获取某一列的值
        $this->assign('tag_ids',$tag_dis);
        //获取文章旧数据
        $odlData = $this->db->where('arc_id',$arc_id)->find();
        $this->assign('data',$odlData);
        return $this->fetch();
       }
       
       /*
        * 放文章到回收站处理
        */
       
     public function recycle(){
       $arc_id = input('param.arc_id');       	  
       if($arc_id){
       	  	 $res = $this->db->save(['is_recycle'=>1],['arc_id'=>$arc_id]);
       	  if($res){
       	  	 $this->success('操作成功','index');exit();
       	  } else {
       	  	 $this->error('操作失败');exit;
       	  }
       	  
       	}
       	 
       	  $all = $this->db->getRall();
          $this->assign('arcAll',$all);
       	  return $this->fetch();
       }
       
       /*
        * 恢复文章到列表操作
        */      
       public function outRecycle(){
       	  $arc_id = input('param.arc_id'); 
       	  	 $res = $this->db->save(['is_recycle'=>2],['arc_id'=>$arc_id]);
       	  if($res){
       	  	 $this->success('恢复文章成功','recycle');
       	  } else {
       	  	 $this->error('操作失败');
       	  }
       }
       
       /*
        * 删除文章
        */
       public function delArc(){
       	 $arc_id = input('param.arc_id');
       	 	 $res = $this->db->where('arc_id',$arc_id)->delete();
       	  if($res){
       	  	 $this->success('删除成功','recycle');
       	  } else {
       	  	 $this->error('操作失败');
       	  }
       }

       /*
        *百度编辑器测试
       */

       public function editor(){
          return $this->fetch();
       }

}



?>
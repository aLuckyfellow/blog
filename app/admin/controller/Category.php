<?php
namespace app\admin\controller;

use think\Controller;
use think\Model;

class Category extends Controller 
{
	protected $db;
	public function __construct() {
		//实例化数据库模型类
        parent::__construct();
        $this->db = new \app\common\model\Category();
        //判断，没有登陆信息不能进入管理		
		//tp5提供的session（）函数，相当于$_SESSION['admin']['admin_id']
		if(!session('admin.admin_id')){
			$this->error('请登录后操作','admin/login/login');
		}
	}
	public function index() {
		//获取数据 ，数据查询
		//$lanmu = db('cate')->select();
		$cateList  = $this->db->getAll();
         $this->assign('lanmu',$cateList);
		return $this->fetch();
	}

	public function addtage(){ //添加父级栏目
		if(request()->isPost()){
           
		   $res = $this->db->store(input('post.'));

		   if($res['valid']){
               $this->success($res['msg'],'admin/Category/index');exit();  
		   } else {
               $this->error($res['msg']);exit();
		   }
		   
		}
		return $this->fetch();
	}

	public function addSon(){ //添加子级栏目
         
        if(request()->isPost()){
           
		   $res = $this->db->store(input('post.'));

		   if($res['valid']){
               $this->success($res['msg'],'admin/Category/index');exit();  
		   } else {
               $this->error($res['msg']);exit();
		   }		   
		}
         $cate_id = input('param.cate_id');
         //halt($cate_id);
         $data = $this->db->where('cate_id',$cate_id)->find();
         $this->assign('data',$data);
		return $this->fetch();

	}
     /* 栏目的修改
     */
	public function edit(){
         
         if(request()->isPost()){
         	$res = $this->db->edit(input('post.'));
            if($res['valid']){
            	$this->success($res['msg'],'admin/Category/index');exit();
            } else {
            	$this->error($res['msg']);exit();
            }
         }
         
           $cate_id = input('param.cate_id');
         //halt($cate_id);
          $data = $this->db->where('cate_id',$cate_id)->find();
         $this->assign('data',$data);
         $data = $this->db->where('cate_id',$cate_id)->select();
         $this->assign('cateDate',$data);
		return $this->fetch();
         
		return $this->fetch();
	}

	public function del(){
		$cate_id = input('param.cate_id');
        $res  = $this->db->del($cate_id);

        if($res['valid']){
        	$this->success($res['msg'],'index');exit();
        } else {
        	$this->error($res['msg']);exit();
        }
	}
}


?>
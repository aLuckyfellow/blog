<?php
namespace app\admin\controller;

use think\Controller;
use think\Model;
use app\common\model\Web;

class Link extends Controller {
	
	protected $db;
	public function __construct() {
		//实例化数据库模型类
        parent::__construct();
        $this->db = new \app\common\model\Link();
        //判断，没有登陆信息不能进入管理		
		//tp5提供的session（）函数，相当于$_SESSION['admin']['admin_id']
		if(!session('admin.admin_id')){
			$this->error('请登录后操作','admin/login/login');
		}
	}
	
	public function index(){
		$linkList = $this->db->paginate(5);
         $this->assign('linkList',$linkList);
		return $this->fetch();
	}
	
	/*
	 * 友链管理操作
	 */
	public function store(){
		
		//添加友链
		if(request()->isPost()){
			$res = $this->db->store(input('post.'));
			
			if($res['valid']){
                $this->success($res['msg'],'admin/link/index');exit();
        	} else {
        		$this->error($res['msg']);exit();
        	}
			
		}
		
		//编辑友链
		 $link_id = input('param.link_id');
        if($link_id){
        	//编辑标签请求
        	$oldData = $this->db->find($link_id);        	
        } else {
        	$oldData = ['link_name'=>'','link_url'=>''];
        	
        }

        $this->assign('oldData',$oldData);
				
		return $this->fetch();
	}
	
	/*
	 * 友链删除
	 */
	public function delLink(){
		$link_id = input('param.link_id');
		
		 if(\app\common\model\Link::destroy($link_id)){
         	$this->success('删除成功','admin/link/index');exit();
         } else {
         	$this->error('操作失败');exit();
         }
	}
	
	/*
	 * 网站配置管理
	 */
	public function web_config(){
		
		//编辑配置信息
		if(request()->isPost()){
			$res = (new Web())->web_config(input('post.'));
			if($res['valid']){
				$this->success('配置成功','admin/link/web_config');exit();
			} else {
				$this->error('配置失败');exit();
			}
		}
		
		//获取配置信息
		$data = (new Web())->where('web_id',1)->find();
		$this->assign('data',$data);
		
		return $this->fetch();
	}
}
?>
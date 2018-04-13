<?php
namespace app\admin\controller;

use think\Controller;

class Tag extends Controller
{

	protected $db;
	public function __construct() {
		//实例化数据库模型类
        parent::__construct();
        $this->db = new \app\common\model\Tag();
        //判断，没有登陆信息不能进入管理		
		//tp5提供的session（）函数，相当于$_SESSION['admin']['admin_id']
		if(!session('admin.admin_id')){
			$this->error('请登录后操作','admin/login/login');
		}
	}

    public function index(){
        //tp5手册分页demo--$list = Db::name('tag')->where('status',)->paginate(10);
    	//查询标签的所有数据，每页显示10天条数据
    	$tagList = db('tag')->paginate(5);
         $this->assign('tagList',$tagList);
    	return $this->fetch();
    }

    /*
    * 添加标签
    */

    public function store(){
       
        //halt($tag_id);

        if(request()->isPost()){
        	//halt($_POST);
        	$res = $this->db->store(input('post.'));

        	if($res['valid']){
                $this->success($res['msg'],'admin/tag/index');exit();
        	} else {
        		$this->error($res['msg']);exit();
        	}
        }
        
        $tag_id = input('param.tag_id');
        if($tag_id){
        	//编辑标签请求
        	$oldData = $this->db->find($tag_id);
        } else {
        	$oldData = ['tag_name'=>''];
        }

        $this->assign('oldData',$oldData);

        return $this->fetch();
    }

    public function del(){     //标签删除
         $tag_id = input('param.tag_id');
         //halt($tag_id);
         if(\app\common\model\Tag::destroy($tag_id)){
         	$this->success('操作成功','admin/tag/index');exit();
         } else {
         	$this->error('操作失败');exit();
         }    

    }
}


?>
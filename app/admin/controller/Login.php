<?php
namespace app\admin\controller;

use app\common\model\Admin;
use think\Controller;

class Login extends Controller
{
	public function login(){
	    
	    if(request()->isPost()){
	    	//halt($_POST); 打印接收到的request对象
	    	$res = (new Admin())->login(input('post.'));

	    	if($res['valid']){
	    		//说明登陆成功
	    		$this->success($res['msg'],'admin/entry/index');exit();
	    	} else {
	    		//说明登陆失败
	    		$this->error($res['msg']);exit();
	    	}
	    }

	    return $this->fetch();
	}
}		


?>


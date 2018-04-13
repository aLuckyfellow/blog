<?php
namespace app\admin\controller;

use app\common\model\Admin;
class Entry extends Common
{
	public function index(){
		return $this->fetch();
	}		

	public function pass(){
        if(request()->isPost()){
        	$res = (new Admin())->pass(input('post.'));
            
            if($res['valid']){
                session(null);
                $this->success($res['msg'],'admin/entry/index');  
            } else {
            	$this->error($res['msg']);exit();
            }
        }

		return $this->fetch();
	}

	public function logout(){
		session(null);
       $this->success('退出成功','admin/entry/index');  
	}
}

?>


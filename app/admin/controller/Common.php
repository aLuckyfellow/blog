<?php
namespace app\admin\controller;

use think\Controller;
use think\Request;

class Common extends Controller
{
	public function __construct(Request $request = null) {
		parent::__construct($request);
		
		//tp5提供的session（）函数，相当于$_SESSION['admin']['admin_id']
		if(!session('admin.admin_id')){
			$this->redirect('admin/login/login');
		}
	}	
}

?>

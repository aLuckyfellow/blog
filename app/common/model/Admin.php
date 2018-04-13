<?php
namespace app\common\model;

use think\Loader;
use think\Model;
use think\Validate;

class Admin extends Model
{
	protected $pk = 'admin_id';//主键
	protected $table = 'blog_admin';
    

  public function login($data){
        //halt($data);打印接收的request对象
        //1.执行验证
        $validate = Loader::validate('Admin');//验证接收的数据

        if(!$validate->check($data)){
        	//dump($validate->getError());打印输入验证为空的错误提示信息
        	return ['valid'=>0,'msg'=>$validate->getError()];
        }
        //2.比对用户的信息
         $info = $this->where('admin_name',$data['admin_name'])->where('admin_password',$data['admin_password'])->find();
         
          if(!$info){
          	  //说明查询不到匹配的
          	 return  ['valid'=>0,'msg'=>'用户名或者密码不正确'];
          }
        //3.将用户的信息存到session中
          session('admin.admin_id',$info['admin_id']);
          session('admin.admin_name',$info['admin_name']);
          return ['valid'=>1,'msg'=>'登陆成功'];
    }
     
     //修改密码
    public function pass($data){
      // halt($data);
      //1.执行验证
        $validate = new Validate([
                  'admin_password'  => 'require',
                  'new_password' => 'require',
                  'confirm_password' =>'require|confirm:new_password'
               ],[
                  'admin_password.require' => '原始密码不能为空',
                  'new_password.require' => '新密码不能为空',
                  'confirm_password.require' => '确认密码不能为空',
                  'confirm_password.confirm' => '确认密码和新密码不一致'

              ]);
               if (!$validate->check($data)) {
                   return ['valid'=>0,'msg'=>$validate->getError()];
               }

               $info = $this->where('admin_password',$data['admin_password'])->where('admin_id',session('admin.admin_id'))->find();
               if(!$info) {
                  return ['valid'=>0,'msg'=>'原始密码不正确'];
               }

                $res = $this->save([
                    'admin_password'=>$data['new_password'],
                ],[$this->pk => session('admin.admin_id')]);
                
                if($res) {
                   return ['valid'=>1,'msg'=>'修改密码成功'];
                } else {
                   return ['valid'=>0,'msg'=>'修改密码失败'];
                }

    }
}


?>
<?php
/**
 * @author  Eddy <cumtsjh@163.com>
 */

namespace App\Model\Admin;

class User extends \App\Model\Front\User
{
    public static $listField = [
        'email' => 'Email',
        'statusText' => '状态'
    ];

    public static $searchField = [
        'email' => 'Email'
    ];

    public function comments()
    {
        return $this->hasMany('App\Model\Admin\Comment', 'user_id');
    }
}

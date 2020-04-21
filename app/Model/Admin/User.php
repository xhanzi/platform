<?php

namespace App\Model\Admin;

class User extends \App\Model\Front\User
{
    public static $listField = [
        'name' => '名称',
        'email' => 'Email',
        'statusText' => '状态'
    ];

    public static $searchField = [
        'name' => '名称',
        'email' => 'Email'
    ];

    public function comments()
    {
        return $this->hasMany('App\Model\Admin\Comment', 'user_id');
    }
}

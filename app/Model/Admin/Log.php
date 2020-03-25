<?php
namespace App\Model\Admin;

class Log extends Model
{
    protected $guarded = [];

    public static $searchField = [
        'user_name' => '用户',
        'url' => 'URL'
    ];

    public static $listField = [
        'user_name' => '用户',
        'url' => 'URL',
        'data' => 'data',
        'ip' => 'IP',
        'ua' => 'userAgent',
    ];

    public function adminUser()
    {
        return $this->belongsTo('App\Model\Admin\AdminUser', 'admin_user_id');
    }
}

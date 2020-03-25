<?php
namespace App\Model\Front;

use Illuminate\Database\Eloquent\Model;

class UserAuth extends Model
{
    protected $guarded = [];

    const AUTH_TYPE_WEIBAO = 0;
    const AUTH_TYPE_WECHAT = 1;
    const AUTH_TYPE_QQ = 2;

    const AUTH_TYPE_NAME = [
        'weibo' => self::AUTH_TYPE_WEIBAO,
        'wechat' => self::AUTH_TYPE_WECHAT,
        'qq' => self::AUTH_TYPE_QQ,
    ];
}

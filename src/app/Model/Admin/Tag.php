<?php

namespace App\Model\Admin;

class Tag extends Model
{
    protected $guarded = [];

    public static $searchField = [
        'name' => '名称'
    ];

    public static $listField = [
        'name' => '名称'
    ];
}

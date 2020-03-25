<?php
namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Repository\Admin\EntityRepository;

class HomeController extends Controller
{
    /**
     * 基础功能-首页
     */
    public function showIndex()
    {
        $opcache = 'false';
        if (function_exists('opcache_get_status') && opcache_get_status() !== false) {
            $opcache = 'true';
        }
        return view('admin.home.index', ['opcache' => $opcache]);
    }

    /**
     * 内容管理-内容管理
     */
    public function showAggregation()
    {
        return view('admin.home.content', ['autoMenu' => EntityRepository::systemMenu()]);
    }
}

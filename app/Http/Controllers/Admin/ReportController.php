<?php
/**
 * @author  Eddy <cumtsjh@163.com>
 */

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\View\View;

class ReportController extends Controller
{
    public function __construct()
    {
        parent::__construct();

        $this->breadcrumb[] = ['title' => '数据报告', 'url' => route('admin::report.index')];
    }

    /**
     * 评论管理-评论列表
     *
     */
    public function index()
    {
        $this->breadcrumb[] = ['title' => '系统环境', 'url' => ''];
        return view('admin.report.index', ['breadcrumb' => $this->breadcrumb]);
    }
}

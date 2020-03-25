<?php
namespace App\Model\Admin;

use Illuminate\Database\Eloquent\Model as BaseModel;

class Model extends BaseModel
{
    /**
     * 搜索字段
     *
     * @var array
     */
    public static $searchField = [];

    /**
     * 列表字段
     *
     * @var array
     */
    public static $listField = [];

    /**
     * 列表操作项
     *
     * @var array
     */
    public static $actionField = [];
}

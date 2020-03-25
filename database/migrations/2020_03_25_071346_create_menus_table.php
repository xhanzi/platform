<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateMenusTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('menus', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('name', 50)->default('')->unique();
			$table->integer('pid')->unsigned()->default(0);
			$table->boolean('status')->default(1);
			$table->boolean('is_lock_name')->default(0);
			$table->integer('order')->unsigned()->default(0);
			$table->string('route', 100)->default('');
			$table->string('url', 512)->default('');
			$table->string('group', 50)->default('');
			$table->string('guard_name', 50)->default('admin');
			$table->string('remark', 191)->default('');
			$table->timestamps();
			$table->string('route_params', 191)->default('')->comment('路由参数');
			$table->unique(['route','route_params']);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('menus');
	}

}

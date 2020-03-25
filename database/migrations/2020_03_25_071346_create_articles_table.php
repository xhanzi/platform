<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateArticlesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('articles', function(Blueprint $table)
		{
			$table->increments('id');
			$table->timestamps();
			$table->string('title', 191)->comment('标题');
			$table->text('content', 65535)->comment('正文');
			$table->integer('admin_user_id')->unsigned()->default(0)->comment('作者');
			$table->integer('category_id')->unsigned()->comment('分类');
			$table->string('introduction', 500)->comment('简介');
			$table->string('keyword')->default('')->comment('关键字');
			$table->string('cover_image')->default('')->comment('封面图');
			$table->boolean('is_publish')->comment('是否已发布');
			$table->string('recommend')->default('');
			$table->string('title_color')->default('');
			$table->text('toutiao', 65535);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('articles');
	}

}

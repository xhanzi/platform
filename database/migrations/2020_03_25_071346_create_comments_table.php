<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateCommentsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('comments', function(Blueprint $table)
		{
			$table->bigInteger('id', true)->unsigned();
			$table->integer('user_id')->unsigned()->default(0);
			$table->boolean('is_admin')->default(0);
			$table->integer('entity_id')->unsigned()->default(0);
			$table->integer('content_id')->unsigned()->default(0);
			$table->string('content', 1024)->default('');
			$table->integer('like')->unsigned()->default(0);
			$table->integer('dislike')->unsigned()->default(0);
			$table->integer('grade')->unsigned()->default(0);
			$table->integer('pid')->unsigned()->default(0)->comment('父ID。方便获取评论的层级关系');
			$table->integer('rid')->unsigned()->default(0)->comment('根ID。方便获取某条评论下的所有评论');
			$table->boolean('status')->default(0);
			$table->integer('reply_count')->unsigned()->default(0);
			$table->integer('reply_user_id')->unsigned()->default(0);
			$table->timestamps();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('comments');
	}

}

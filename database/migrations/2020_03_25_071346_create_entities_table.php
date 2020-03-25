<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateEntitiesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('entities', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('name', 50)->default('');
			$table->string('table_name', 64)->default('')->unique();
			$table->string('description', 191)->default('');
			$table->integer('is_internal')->unsigned()->default(0);
			$table->integer('enable_comment')->unsigned()->default(0);
			$table->boolean('is_show_content_manage')->default(1);
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
		Schema::drop('entities');
	}

}

<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateCategoriesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('categories', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('name', 50)->default('');
			$table->integer('pid')->unsigned()->default(0);
			$table->integer('model_id')->unsigned()->default(0);
			$table->integer('order')->unsigned()->default(0);
			$table->string('title', 191)->default('');
			$table->string('keywords', 191)->default('');
			$table->string('description', 191)->default('');
			$table->timestamps();
			$table->unique(['pid','name','model_id']);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('categories');
	}

}

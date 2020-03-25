<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateConfigsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('configs', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('name', 50)->default('');
			$table->string('key', 100)->default('')->unique();
			$table->string('value', 2048)->default('');
			$table->boolean('type')->default(0);
			$table->string('group', 50)->default('');
			$table->string('remark', 191)->default('');
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
		Schema::drop('configs');
	}

}

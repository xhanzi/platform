<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateSensitiveWordsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('sensitive_words', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('type', 191)->default('');
			$table->string('noun', 191)->default('');
			$table->string('verb', 191)->default('');
			$table->string('exclusive', 191)->default('');
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
		Schema::drop('sensitive_words');
	}

}

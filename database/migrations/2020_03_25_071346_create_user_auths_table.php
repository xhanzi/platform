<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateUserAuthsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('user_auths', function(Blueprint $table)
		{
			$table->bigInteger('id', true)->unsigned();
			$table->integer('user_id')->unsigned()->default(0);
			$table->boolean('type')->default(0);
			$table->string('openid', 191)->default('');
			$table->string('avatar', 191)->default('');
			$table->string('username', 191)->default('');
			$table->string('nick_name', 191)->default('');
			$table->string('email', 191)->default('');
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
		Schema::drop('user_auths');
	}

}

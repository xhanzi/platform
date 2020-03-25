<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateCoursesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('courses', function(Blueprint $table)
		{
			$table->increments('id');
			$table->timestamps();
			$table->string('title', 64)->default('');
			$table->boolean('teacher_id')->default(0);
			$table->string('image')->default('');
			$table->string('desc')->default('');
			$table->date('open_date')->nullable();
			$table->string('level')->default('');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('courses');
	}

}

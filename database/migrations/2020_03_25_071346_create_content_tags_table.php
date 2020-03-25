<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateContentTagsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('content_tags', function(Blueprint $table)
		{
			$table->bigInteger('id', true)->unsigned();
			$table->integer('entity_id')->unsigned()->index('tag_id');
			$table->integer('content_id')->unsigned();
			$table->bigInteger('tag_id')->unsigned();
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
		Schema::drop('content_tags');
	}

}

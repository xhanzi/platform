<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateEntityFieldsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('entity_fields', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('name', 64)->default('');
			$table->string('type', 191)->default('');
			$table->string('comment', 100)->default('');
			$table->string('default_value', 191)->default('');
			$table->string('form_name', 20)->default('');
			$table->string('form_type', 191)->default('');
			$table->string('form_comment', 100)->default('');
			$table->string('form_params', 1024)->default('');
			$table->boolean('is_show')->default(1);
			$table->boolean('is_show_inline')->default(0);
			$table->boolean('is_edit')->default(1);
			$table->boolean('is_required')->default(0);
			$table->integer('entity_id')->unsigned()->default(0);
			$table->integer('order')->unsigned()->default(77);
			$table->timestamps();
			$table->string('form_default_value', 191)->default('')->comment('字段表单默认值');
			$table->unique(['entity_id','name']);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('entity_fields');
	}

}

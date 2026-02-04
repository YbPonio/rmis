<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::connection('mysql_rmis')->create('documents', function (Blueprint $table) {
            $table->id();

            $table->integer('origin_id');
            $table->integer('document_type');

            $table->string('title');
            $table->string('document_number');
            $table->string('document_series');

            $table->dateTime('date_issued')->nullable();
            $table->dateTime('date_received')->nullable();

            $table->string('file_path')->nullable();
            $table->integer('file_size')->default(0);

            $table->integer('issued_by')->nullable();

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::connection('mysql_rmis')->dropIfExists('documents');
    }
};

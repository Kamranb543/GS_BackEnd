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
        Schema::create('product_categories', function (Blueprint $table) {
            $table->id('pc_id');
            $table->unsignedBigInteger('p_id');
            $table->foreign('p_id')->references('pid')->on('products');
            $table->unsignedBigInteger('c_id');
            $table->foreign('c_id')->references('cat_id')->on('categories');
            $table->timestamps();
        });
    }
    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('product_categories');
    }
};

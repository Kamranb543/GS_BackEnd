<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\productController;
use App\Http\Controllers\userController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/



Route::get('location/', [productController::class, 'location']);

// single Data
Route::get('productList/{id}', [productController::class, 'product']);
// categories available
Route::get('categories', [productController::class, 'categoryList']);
// Limited records
Route::get('products/{limit}', [productController::class, 'productLimit']);

Route::post('uploadProduct/', [productController::class, 'uploadProduct']);

Route::middleware('auth:sanctum')->group(function () {
    // all data
    Route::post('logout/', [userController::class, 'logout']);
    Route::post('placeOrders/', [productController::class, 'placeOrder']);
    Route::get('ordersList/{id}', [productController::class, 'ordersList']);

});
Route::get('allOrders', [productController::class, 'allOrders']);
Route::get('productList/', [productController::class, 'productList']);

Route::post('register/', [userController::class, 'register']);
Route::post('login/', [userController::class, 'login']);

<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\CountryController;
use App\Http\Controllers\Api\CityController;
use App\Http\Controllers\Api\PostController;
use App\Http\Controllers\Api\UserimageController;
use Illuminate\Support\Facades\Auth;


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


Route::post('/auth/register',[AuthController::class,'createUser']);
Route::post('/auth/login',[AuthController::class,'loginUser']);


    Route::resource('country', CountryController::class)->middleware('auth:sanctum');
    Route::resource('city', CityController::class)->middleware('auth:sanctum');
    Route::post('posts', [PostController::class, 'store'])->middleware('auth:sanctum'); 
    Route::get('posts', [PostController::class, 'index']);
    // ->middleware('auth:sanctum'); 
    Route::post('userimage', [UserimageController::class, 'store']);
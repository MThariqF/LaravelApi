<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AkunController;
use App\Http\Controllers\ResepController;
use App\Http\Controllers\FavoriteController;

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

Route::get("akun/{email}/{pass}", [AkunController::class, 'cek']);
Route::post("akun", [AkunController::class, 'tambah']);

Route::get("resep", [ResepController::class, 'tampil']);
Route::post("resep", [ResepController::class, 'tambah']);
Route::delete("resep/{id}", [ResepController::class, 'hapus']);

Route::get("favorite/{id_akun}", [FavoriteController::class, 'tampil']);
Route::post("favorite/{id}/{id_resep}", [FavoriteController::class, 'tambah']);
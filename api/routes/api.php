<?php

use App\Http\Controllers\DocumentController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function () {
    return response()->json('Hello World');
});


Route::controller(DocumentController::class)->group(function () {
    Route::post('/document/upload', 'store');
});
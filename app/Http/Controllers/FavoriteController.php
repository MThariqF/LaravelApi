<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;

use Illuminate\Http\Request;

class FavoriteController extends Controller
{
    public function tampil($id_akun){
        $data = DB::select("CALL tampilFavorite($id_akun)");
        return response()->json($data);
    }

    public function tambah($id, $id_resep){
        DB::select("CALL tambahFavorite($id, $id_resep)");
        return "Success";
    }
}

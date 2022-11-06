<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;

use Illuminate\Http\Request;

class ResepController extends Controller
{
    public function tampil(){
        $data = DB::select("CALL tampilResep()");
        return response()->json($data);
    }

    public function tambah(Request $request){
        DB::select("CALL tambahResep($request->id, $request->nama, $request->desk, $request->gambar, $request->rating, $request->jumlah, $request->id_penulis)");
        return "Success";
    }

    public function hapus($id){
        DB::select("CALL hapusResep($id)");
        return "Success";
    }
}

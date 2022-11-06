<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AkunController extends Controller
{
    public function cek($email, $pass){
        $data = DB::select("CALL cekAkun($email, $pass)");
        return response()->json($data);
    }

    public function tambah(Request $request){
        DB::select("CALL tambahAkun($request->id, $request->nama, $request->email, $request->pass)");
        return "Success";
    }
}

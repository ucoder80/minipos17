<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Transection;

class TransectionController extends Controller
{
    //
    public function __construct(){
        $this->middleware("auth:api");
    }

    public function add(Request $request){
        try {
            foreach($request->listorder as $item){
                $tran = new Transection([
                    "tran_id"=> time().mt_rand(0, 15),
                    "tran_type"=> "income",
                    "product_id"=> $item["id"],
                    "qty"=> $item["order_qty"],
                    "price"=> $item["price_sell"],
                    "detail"=> $item["name"]
                ]);
                $tran->Save();
            }

            $success = true;
            $message = "ບັນທືກຂໍ້ມູນ ສຳເລັດ";
        } catch (\Illuminate\Database\QueryException $ex){
            $success = false;
            $message = $ex->getMessage();
        }

        $response = [
            'success' => $success,
            'message' => $message
        ];
        return response()->json($response);
    }
}

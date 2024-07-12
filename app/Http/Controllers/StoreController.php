<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Store;

class StoreController extends Controller
{
    //
    public function __construct(){
        $this->middleware("auth:api");
    }

    public function index(){
        // $store = store::orderBy("id","asc")->get();
        // return $store;

        $sort = \Request::get("sort");
        $perpage = \Request::get("perpage");
        $search = \Request::get("search");

        $store = store::orderBy("id", $sort)
        ->where(
            function($query) use ($search){
                $query->where("name","LIKE","%{$search}%")
                ->orWhere("qty","LIKE","%{$search}%")
                ->orWhere("price_buy","LIKE","%{$search}%");
            }
        )
        ->paginate($perpage)
        ->toArray();

        return array_reverse($store);
    }

    public function add(Request $request){
        try {

            //save image route
            $upload_path = "assets/img";

            if($request->file("image")){
                //change image file name
                $new_name_img = time().".".$request->image->getClientOriginalExtension();

                //Upload Image
                $request->image->move(public_path($upload_path),$new_name_img);
            } else{
                $new_name_img = "";
            }

            $store = new Store([
                "name" => $request->name,
                "image" => $new_name_img,
                "qty" => $request->qty,
                "price_buy" => $request->price_buy,
                "price_sell" => $request->price_sell,

            ]);
            $store->save();

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

    public function edit($id){
        $store = Store::find($id);
        return $store;
    }

    public function update($id,Request $request){
        try {
            $store = Store::find($id);

            // ກຳນົດເສັ້ນທາງ ບັນທຶກຮູບພາບ
            $upload_path = "assets/img";

            // ກວດເບີ່ງມີໄຟລ໌ ຖຶກອັບໂຫຼດມາຫຼືບໍ່
            if($request->file("image")){

                // ກວດຊື້ໃນຖານຂໍ້ມູນ ຖ້າມີຊື່ໄຟລຮູບ ໃຫ້ທຳການລຶບຮູບພາບ
                if($store->image){
                    if(file_exists($upload_path."/".$store->image)){
                        unlink($upload_path."/".$store->image);
                    }
                }

                // ປ່ຽນຊື່ຮູບພາບ
                $new_name_img = time().".".$request->image->getClientOriginalExtension();

                // ອັບໂຫຼດຮູບພາບ
                $request->image->move(public_path($upload_path),$new_name_img);

                // ອັບເດດຂໍ້ມູນ
                $store->update([
                    "name" => $request->name,
                    "image" => $new_name_img,
                    "qty" => $request->qty,
                    "price_buy" => $request->price_buy,
                    "price_sell" => $request->price_sell,
                ]);

            } else {

                if($request->image){  // ບໍ່ມີການອັບໂຫຼດຮູບພາບ

                     // ອັບເດດຂໍ້ມູນ
                    $store->update([
                        "name" => $request->name,
                        // "image" => $new_name_img,
                        "qty" => $request->qty,
                        "price_buy" => $request->price_buy,
                        "price_sell" => $request->price_sell,
                    ]);

                } else { // ມີການລຶບຮູບພາບ ຫຼື ບໍ່ມີຊື່ຮູບພາບ
                    
                    if($store->image){
                        if(file_exists($upload_path."/".$store->image)){
                            unlink($upload_path."/".$store->image);
                        }
                    }

                     // ອັບເດດຂໍ້ມູນ
                     $store->update([
                        "name" => $request->name,
                        "image" => null,
                        "qty" => $request->qty,
                        "price_buy" => $request->price_buy,
                        "price_sell" => $request->price_sell,
                    ]);

                }
               
            }
            $success = true;
            $message = "ອັບເດດຂໍ້ມູນ ສຳເລັດ";
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

    public function delete($id){
        try {
            $store = Store::find($id);

            //save image route
            $upload_path = "assets/img";
             
            if($store->image){
                if(file_exists($upload_path."/".$store->image)){
                    unlink($upload_path."/".$store->image);
                }
            }
            
            $store->delete();
            $success = true;
            $message = "ລືບຂໍ້ມູນ ສຳເລັດ";
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

<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use JWTAuth;

class UserController extends Controller
{
    //
    public function created_user(request $request){
        try {

            $user = new User([
                "name" => $request->user_name,
                "email" => $request->user_email,
                "password" => hash::make($request->password)
            ]);
            $user->save();

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
    public function login(Request $request){
        $user_login = [
            'email' => $request-> email,
            'password' => $request-> password
        ];
        $token = JWTAuth::attempt($user_login);
        $user_data = Auth::user();

        if($token){
            $response=[
                'success' => true,
                'message' =>  'ສຳເລັດ!',
                'user_data' => $user_data,
                'token' => $token
            ];
        } else {
            $response=[
                'success' => false,
                'message' =>  'ອີເມວ ຫຼື ລະຫັດຜ່ານບໍ່ຖືກຕ້ອງ!'
            ];
        }

        return response()->json($response);
    }

    public function logout(){
        $token = JWTAuth::getToken();
        $invalidate = JWTAuth::invalidate($token);

        if($invalidate){
            $response=[
                'success' => true,
                'message' =>  'ສຳເລັດ!',
            ];
        } else{
            $response=[
                'success' => false,
                'message' =>  'ບໍ່ສຳເລັດ!',
            ];

        }
        return response()->json($response);
    }
}

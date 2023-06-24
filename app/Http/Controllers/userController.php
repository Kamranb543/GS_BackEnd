<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
class userController extends Controller
{
    public function register(Request $req)
    {
        $validator = Validator::make($req->all(),[
            'name'=>'required',
            'email'=>'required|email|unique:users,email',
            'password'=>'required|min:6',
            'confirmPassword'=>'required|same:password',
            'role'=>'required|in:admin,seller,client'
        ]);

    if($validator->fails()){
        return response()->json(['error'=>$validator->errors()],422);
    }else{
        try {
            DB::beginTransaction();
            $user =   User::create([
                    'name' => $req->name,
                    'email' => $req->email,
                    'password' => $req->password,
                    'role' => $req->role
                  ]);
                  $token = $user->createToken('userToken')->plainTextToken;
            DB::commit();
            return response()->json(['success'=>"User Registered Successfully",'token'=>$token,'userData'=>$user]);
        } catch (\Throwable $th) {
            DB::rollBack();
            return response()->json(['error'=>"Database Problem please try again later"]);
        }
    }
    }




    public function login(Request $req)
    {
        $validator = Validator::make($req->all(),[
            'email'=>'required',
            'password'=>'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['error'=>$validator->errors()],422);
        } else {
            // if (Auth::attempt(['email'=>$req->email,'password'=>$req->password])) {
            //     $accessToken = Auth::createToken('authToken')->accessToken;
            //     return response()->json(['success'=>'Logged in successfully!', 'access_token' =>' $accessToken'],200);
            // } else {
            //     return response()->json(['error'=>'Unauthorized'],401);
            // }
            $user = User::select('id','name','role')->where('email',$req->email)->where('password',$req->password)->first();
            if ($user) {
                $token = $user->createToken('userToken')->plainTextToken;
                return response()->json(['success'=>'Logged in successfully!', 'userToken' => $token,'userData'=>$user],200);
            } else {
                    return response()->json(['error'=>'Unauthorized'],401);
              }
        }
        // return response()->json(['success'=>'Logged in successfully!'],200);
    }

    public function logout(Request $req)
    {
        $token = explode('|', $req->token);

        try {
            DB::beginTransaction();
            $deletedRows = DB::table('personal_access_tokens')->where('id', $token[0])->delete();
            DB::commit();

            if ($deletedRows > 0) {
                return response()->json(['success' => "Logged Out Successfully"]);
            } else {
                return response()->json(['error' => "Token not found"]);
            }
        } catch (\Throwable $th) {
            DB::rollBack();
            return response()->json(['error' => "Database Problem, please try again later"]);
        }
                return response()->json(['success' => $req->token]);
        // return 'logout';
    }
}

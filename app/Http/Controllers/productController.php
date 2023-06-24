<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Models\Product;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use App\Models\category;
use App\Models\productCategory;
use App\Models\order;

class productController extends Controller
{

    public function uploadProduct(Request $req)
    {
        $validator = Validator::make($req->all(), [
            'name' => 'required|string',
            "desc" => 'required|string',
            "sysreq" => 'required|string',
            "price" => 'required|numeric',
            "category" => 'required',
            "img" => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'error' => $validator->errors()
            ], 422);
        }

        $img = $req->file('img');
        $name = $img->getClientOriginalName();
        $path = $img->storeAs('thumbnail', $name);
        $url = url($path);

        DB::beginTransaction();

        try {
            $product = Product::create([
                'name' => $req->name,
                'desc' => $req->desc,
                'price' => $req->price,
                'sysreq' => $req->sysreq,
                'img' => $url
            ]);

            $category = explode(',', $req->category);
            $product->categories()->attach($category);

            DB::commit();

            return response()->json([
                'success' => 'data Saved'
            ], 200);
        } catch (\Throwable $th) {
            DB::rollBack();
            return response()->json([
                'error' => 'Internal Server'
            ], 500);
        }
    }




    public function productList()
    {

        try {
            DB::beginTransaction();
            $data = Product::select('products.*',  DB::raw('GROUP_CONCAT(DISTINCT categories.cat_name SEPARATOR ",") as cat_name'))
                ->leftJoin('product_categories', 'products.pid', '=', 'product_categories.p_id')
                ->leftJoin('categories', 'categories.cat_id', '=', 'product_categories.c_id')->groupBy('products.pid', 'products.name', 'products.price', 'products.desc', 'products.sysreq', 'products.img', 'products.created_at', 'products.updated_at')
                ->orderBy('products.created_at', 'desc')
                ->get();
            DB::commit();
            if ($data->isEmpty()) {
                return response()->json(["empty" => "No orders found"]);
            }else{
                return response()->json(["products" => $data]);
            }
        } catch (\Throwable $th) {
            DB::rollBack();
            return response()->json([
                'error' => 'Internal Server'
            ], 500);
        }
    }
    public function productLimit($limit)
    {

        try {
            DB::beginTransaction();
            $data = Product::select('products.*',  DB::raw('GROUP_CONCAT(DISTINCT categories.cat_name SEPARATOR ",") as cat_name'))
                ->leftJoin('product_categories', 'products.pid', '=', 'product_categories.p_id')
                ->leftJoin('categories', 'categories.cat_id', '=', 'product_categories.c_id')->groupBy('products.pid', 'products.name', 'products.price', 'products.desc', 'products.sysreq', 'products.img', 'products.created_at', 'products.updated_at')
                ->latest()->take($limit)->get();
            // return response()->json($data);
            DB::commit();
              if ($data->isEmpty()) {
                return response()->json(["empty" => "No orders found"]);
            }else{
                return response()->json(["products" => $data]);
            }
        } catch (\Throwable $th) {
            DB::rollBack();
            return response()->json([
                'error' => 'Internal Server'
            ], 500);
        }
    }




    public function product($id)
    {
        try {
            DB::beginTransaction();
            $data = Product::select('products.*', DB::raw('GROUP_CONCAT(DISTINCT categories.cat_name SEPARATOR ",") as cat_name'))
                ->leftJoin('product_categories', 'products.pid', 'product_categories.p_id')->leftJoin('categories', 'categories.cat_id', 'product_categories.c_id')->groupBy('products.pid', 'products.name', 'products.price', 'products.desc', 'products.sysreq', 'products.img', 'products.created_at', 'products.updated_at')
                ->where('products.pid', $id)->get();
            DB::commit();
            return response()->json($data);
        } catch (\Throwable $th) {
            DB::rollBack();
            return response()->json([
                'error' => 'Internal Server'
            ], 500);
        }
    }



    public function categoryList()
    {
        try {
            DB::beginTransaction();
            $data = category::all();
            DB::commit();
            return response()->json($data);
        } catch (\Throwable $th) {
            DB::rollBack();
            return response()->json([
                'error' => 'Internal Server'
            ], 500);
        }
    }






    public function location()
    {
        $data = [
            'Hafizabad',
            'Lahore',
            'Faisalabad',
            'Karachi'
        ];
        return response()->json($data, 200);
    }



    public function placeOrder(Request $req)
    {

        $validator = Validator::make($req->all(), [
            'userName' => 'required|string',
            "phone" => 'required|string',
            "payment" => 'required|string',
            "address" => 'required|string',
            "products" => 'required',
            "userId" => 'required|numeric',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'error' => $validator->errors()
            ], 422);
        } else {
            $parsed = json_decode($req->products);
            try {
                DB::beginTransaction();
                foreach ($parsed as $key) {
                    foreach ($key as $rec => $value) {
                        $order = new order;
                        $order->userName = $req->userName;
                        $order->phone = $req->phone;
                        $order->address = $req->address;
                        $order->payment = $req->payment;
                        $order->qty = $value->qty;
                        $order->product_id = $rec;
                        $order->user_id = $req->userId;
                        $order->save();
                    }
                };
                DB::commit();
                return response()->json([
                    'success' => true
                ], 200);
            } catch (\Throwable $th) {
                DB::rollBack();
                return response()->json([
                    'error' => 'Internal Server Error'
                ], 500);
            };
        }
    }

    public function ordersList($id)
    {
        try {
            $orders = DB::table('orders')
                ->join('products', 'orders.product_id', '=', 'products.pid')
                ->select('orders.*', 'products.name', 'products.price', 'products.img', 'products.created_at as productPlaced')->where('orders.user_id',$id)
                ->orderBy('products.created_at', 'desc')->get();

            if ($orders->isEmpty()) {
                return response()->json(["empty" => "No orders found"]);
            }else{
                return response()->json(["orders" => $orders]);
            }

        } catch (\Throwable $th) {
            return response()->json(['error' => 'Internal server error'], 500);
        }
    }
    public function allOrders()
    {
        try {
            $orders = DB::table('orders')
                ->join('products', 'orders.product_id', '=', 'products.pid')
                ->select('orders.*', 'products.name', 'products.price', 'products.img', 'products.created_at as productPlaced')
                ->orderBy('products.created_at', 'desc')->get();

            if ($orders->isEmpty()) {
                return response()->json(["empty" => "No orders found"]);
            }else{
                return response()->json(["orders" => $orders]);
            }

        } catch (\Throwable $th) {
            return response()->json(['error' => 'Internal server error'], 500);
        }
    }
}

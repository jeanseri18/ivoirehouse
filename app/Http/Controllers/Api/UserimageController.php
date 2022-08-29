<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\userimage;
use Illuminate\Http\Request;
use App\Http\Requests\UserimageStoreRequest;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;

class UserimageController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(UserimageStoreRequest $request)
    {
        try {
            $imageName = Str::random(32).".".$request->image->getClientOriginalExtension();
      
            $post=   Userimage::create([
                'image' => $imageName,
                'user_id'=>$request->user_id
            ]);
   
            // Save Image in Storage folder
            Storage::disk('public')->put($imageName, file_get_contents($request->image));
     
            // Return Json Response
            return response()->json([
                'status'=>true, 
                'message' => "Post successfully created."
            ],200);
        } catch (\Exception $e) {
            // Return Json Response 
            
            return response()->json([
                'status'=>false, 
                'message' => "Something went really wrong!"
            ],500);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\userimage  $userimage
     * @return \Illuminate\Http\Response
     */
    public function show(userimage $userimage)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\userimage  $userimage
     * @return \Illuminate\Http\Response
     */
    public function edit(userimage $userimage)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\userimage  $userimage
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, userimage $userimage)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\userimage  $userimage
     * @return \Illuminate\Http\Response
     */
    public function destroy(userimage $userimage)
    {
        //
    }
}

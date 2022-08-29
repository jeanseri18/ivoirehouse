<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\post;
use App\Models\Userimage;
use Illuminate\Http\Request;
use App\Http\Requests\PostStoreRequest;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;
 
class PostController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $posts=Post::all();
        // $data=[];
        // for ($i=0; $i < count($posts); $i++) { 
        //     $userimage=Userimage::where('user_id','1')->get();
        //     $data[$i]=[
        //     'data'=>$posts[$i],
        //     'userimage'=>$userimage]
        //   ;
        // }
        // $data['user']=$posts;
        
        return response()->json(
            [
                'status'=>true, 
                'message'=>'list of posts',
                'data'=> $posts
              
            ],200);
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
    public function store(PostStoreRequest $request)
    {
        // $imageName = Str::random(32).".".$request->image->getClientOriginalExtension();
      
        // $post=   Post::create([
        //     'title' => $request->title,
        //     'description' => $request->description,
        //     'isgo' => $request->isgo,
        //     'date' => $request->date,
        //     'image' => $imageName,
        //     'user_id'=>$request->user_id
        // ]);
        
        
        try {
            $imageName = Str::random(32).".".$request->image->getClientOriginalExtension();
      
            $post=   Post::create([
                'title' => $request->title,
                'description' => $request->description,
                'isgo' => $request->isgo,
                'date' => $request->date,
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
     * @param  \App\Models\post  $post
     * @return \Illuminate\Http\Response
     */
    public function show(post $post)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\post  $post
     * @return \Illuminate\Http\Response
     */
    public function edit(post $post)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\post  $post
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, post $post)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\post  $post
     * @return \Illuminate\Http\Response
     */
    public function destroy(post $post)
    {
        //
    }
}

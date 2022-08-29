<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\country;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class CountryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $country=Country::all();
         return response()->json(
        [
            'status'=>true,
            'message'=>'list of country',
            'data'=>$country
          
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
    public function store(Request $request)
    {
        $validateData= Validator::make($request->all(),
        [
            'name'=>'required',
           
        ]);
    
    
        if($validateData->fails()){
            return response()->json(
                [
                    'status'=>false,
                    'message'=>'validation error',
                    'errors'=>$validateData->erros()
                ],401);
        }
        $country=Country::create([
            'country_name'=>$request->name,
        ]);
    
        return response()->json([
            'status'=>true,
            'message'=>'country create sucessful',
            'data'=>$country,
          
        ],200);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\country  $country
     * @return \Illuminate\Http\Response
     */
    public function show(country $country)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\country  $country
     * @return \Illuminate\Http\Response
     */
    public function edit(country $country)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\country  $country
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, country $country)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\country  $country
     * @return \Illuminate\Http\Response
     */
    public function destroy(country $country)
    {
        //
    }
}

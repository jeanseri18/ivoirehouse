<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class PostStoreRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

     /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {
        if(request()->isMethod('post')) {
            return [ 
                'title' => 'required|string',
                'description' => 'required|string',
                'isgo' => 'required|string',
                'date'=>'required|string',
                'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
                'user_id'=>'required|integer'
                
            ];
        } else {
            return [
                'title' => 'required|string',
                'description' => 'required|string',
                'isgo' => 'required|string',
                'date'=>'required|string',
                'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
                'user_id'=>'required|integer'
            ];
        }
    }
 
    /**
     * Custom message for validation
     *
     * @return array
     */
    public function messages()
    {
        if(request()->isMethod('post')) {
            return [
                'title.required' => 'title is required!',
                'date.required' => 'date is required!',
                'isgo.required' => 'isgo is required!',
                'description.required' => 'Descritpion is required!',
                'image.required' => 'Image is required!'
                
            ];
        } else {
            return [
                'title.required' => 'title is required!',
                'date.required' => 'date is required!',
                'isgo.required' => 'isgo is required!',
                'description.required' => 'Descritpion is required!',
                
            ];   
        }
    }
}

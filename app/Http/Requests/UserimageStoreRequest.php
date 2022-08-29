<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UserimageStoreRequest extends FormRequest
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
     * @return array
     */
    public function rules()
    {
        if(request()->isMethod('post')) {
            return [ 
                'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
                'user_id'=>'required|integer'
                
            ];
        } else {
            return [
               
                'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
                'user_id'=>'required|integer'
            ];
        }
    }
}

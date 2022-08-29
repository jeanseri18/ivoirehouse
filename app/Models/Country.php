<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\City;

class Country extends Model
{
    public $table='country';    
    protected $fillable = [
        'id',
        'country_name',
    ];
 
    public function city()
    {
        return $this->hasMany(City::class, 'country_id', 'id');
    }

    
}

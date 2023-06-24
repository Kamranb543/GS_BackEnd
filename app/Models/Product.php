<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\category;
class Product extends Model
{
    use HasFactory;
    protected $primaryKey = 'pid';
    protected $fillable = [
        'name',
        'price',
        'desc',
        'sysreq',
        'img',
    ];
    public function categories(){
        return $this->belongsToMany(category::class,'product_categories','p_id','c_id');
    }
}

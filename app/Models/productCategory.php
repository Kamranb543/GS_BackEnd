<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class productCategory extends Model
{
    use HasFactory;
    protected $primaryKey = 'pc_id';
    protected $fillable = [
        'p_id',
        'c_id',
    ];
}

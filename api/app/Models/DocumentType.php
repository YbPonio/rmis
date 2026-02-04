<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DocumentType extends Model
{
    protected $connection = 'mysql_rmis';

    protected $table = 'document_types';
    public $timestamps = true;

    protected $fillable = [
        'title',
        'description',
    ];
}

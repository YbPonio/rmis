<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Document extends Model
{
    protected $connection = 'mysql_rmis';

    protected $table = 'documents';
    public $timestamps = false;

    protected $fillable = [
        'origin_id',
        'document_type',

        'title',
        'document_number',
        'document_series',

        'date_issued',
        'date_received',

        'file_path',
        'file_size',

        'issued_by',
    ];
}

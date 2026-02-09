<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class Document extends Controller
{
    public function store(Request $request)
    {
        $file = $request->file('file');

        Storage::disk('google')->put($file->getClientOriginalName(), file_get_contents($file));

        return response()->json(['message' => 'File uploaded successfully']);
    }
}

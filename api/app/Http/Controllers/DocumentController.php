<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class DocumentController extends Controller
{
    public function store(Request $request)
    {
        if ($request->hasFile('file')) {
            $file = $request->file('file');
            $content = $file->get();

            Storage::disk('google')->put('RMIS/' . $file->getClientOriginalName(), $content);

            return response()->json([
                'message' => 'File received',
                'path' => 'RMIS/' . $file->getClientOriginalName(),
                'size' => $file->getSize()
            ]);
        }

        return response()->json(['message' => 'No file uploaded'], 400);
    }
}

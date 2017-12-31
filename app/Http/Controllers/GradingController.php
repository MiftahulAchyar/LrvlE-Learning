<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Grading;
use App\Quiz;
use App\StudentAssignment;
use Auth;
use DB;
use Session;

class GradingController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    
}

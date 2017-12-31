<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Assingment;
use App\StudentAssingment;
use Auth;
use Validate;
use DB;
use Session as Flash;

class StudentAssignmentController extends Controller
{
	   public function __construct()
    {
        $this->middleware('auth');
    }
    
    public function store(Request $request){
    	$user = Auth::user();


      $validatedData = $request->validate([
        'assignment_id' => 'required',
        'file' => 'required',
      ]);

    	$file = $request->file('file');
    	$assignment_id = $request->input('assignment_id');


    	if(empty($assignment_id) || empty($file) ){
    		return response()->json(['error' => 'true', 'message' => 'data tidak lengkap']);
    	}

    	$filename = $user->id."_".$assignment_id.".".$file->getClientOriginalExtension();
    	$destinationPath = 'files/student_assignment';
      	$file->move($destinationPath,$filename);


      	$studentAssingment = StudentAssingment::where("user_id",$user->id)->where("assignment_id",$assignment_id)->first();
      	if(!empty($studentAssingment)){
      		$studentAssingment['file_path'] = $destinationPath;
      		$studentAssingment->save();
      	}else{
      		$data['file_path'] = $destinationPath."/".$filename ;
      		$data['assignment_id'] = $assignment_id;
		  	  $data['user_id'] = $user->id;
			    $studentAssingmentCreated = StudentAssingment::create($data);
      	}

        return redirect()->back();

    }


    public function showStudentSubmission_teacher($a_id)
    {
      $user = Auth::user();
      $assignment = Assingment::where("id",$a_id)->first();
      $studentAssingment = StudentAssingment::where("assignment_id",$a_id)->get();
      return view('teachers/student-assignment', 
                      ['user' => $user,
                      'assignment' =>  $assignment ,
                      'studentAssignment' =>  $studentAssingment ]);
    }

    public function gradeSubmission_teacher(Request $request)
    {   
        $user = Auth::user();
        // $this->validate($request, [
        //     'user_id' => 'required',
        //     'assignment_id'=>'assignment_id',
        //     'grade' => 'required'//,
        //     // 'description' => 'required'
        // ]);
        DB::table('student_assignments')->where('id',$request->input('id'))
                    ->update([
                                'user_id' => $request->input('user_id'),
                                'assignment_id'=> $request->input('assignment_id'),
                                'grade'=> $request->input('grade')
                        ]);
        Flash::flash('flash_message', 'An assignment grade updated successfully');
        return redirect('/assignment/student-submission/'.$request->input('assignment_id')); 
    }
}

 @include('layouts/header')
 <!-- <link rel="stylesheet" href="{{URL::to('plugins/datatables/dataTables.bootstrap.css')}}"> -->

  <!-- Left side column. contains the logo and sidebar -->
  
  
  <link rel="stylesheet" href="{{URL::to('bower_components/bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.min.css')}}" />

@include('layouts/teacher_nav')
<div class="content-wrapper">
    <section class="content">

      <div class="row">
      		<div class="col-md-10">
	          <div class="box box-danger">
	            <div class="box-header">
	                <h3 class="box-title">
	                  Quiz Answers
	                </h3>
	                <div class="box-tools pull-right">
	                  <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
	                </div>
	            </div>
	            <div class="box-body">
	            	
	            	<b>Session Name : {{$session->title}}</b><br>
	            	<b>Student username : {{$student->username}}</b><br>
	            <form action="{{url('quiz/updategrade')}}" method="post">
	            	{{ csrf_field() }}
              		<input type="hidden" name="q_id" value="{{$q_id}}">
              		
              		<input type="hidden" name="student_id" value="{{$student->id}}">
	              <table class="table">
	                <tr>
	                  <th>No</th>
	                  <th>Question</th>
	                  <th>Type</th>
	                  <th>Student answer</th>
	                  <th>True answer</th>
	                  <th>Checklist true | false</th>
	                </tr>
	                <?php $i=1; 
	                foreach($questions as $question){ ?>
	                <tr>
	                  <td>{{$i}}</td>
	                  <td>{{$question->question}}</td>
	                  <td>{{($question->is_essay==1)? "Essay":"Multiplechoice"}}</td>
	                  <?php //$quizAnswer->quizQuestions->where('quiz_id', $quizAnswer->quiz_quesion_id) as $qq ?>
	                  <?php $ans = $answers->where('quiz_question_id', $question->id)->first();//=$question->quizStudentAnswers
	                  					//>where('quiz_question_id', $question->id)->where('user_id', $student->id)->first(); ?>
	                  <td>{{$ans->answer}}</td>
	                  <td>{{$question->answer}}</td>
	                  <td>
	                    <div class="checkbox">
	                      <label>
	                      	<input name="quiz_answer_id[]" type="hidden" value="$question->id">

	                      	<?php $temp = $i-1; ?>
	                      	@if($question->is_essay==0 AND $question->answer == $ans->answer)
		                      	<div class="form-group">
			                      <div class="radio">
			                        <label>
			                          <input type="radio" name="true[]" id="optionsRadios2" value="1">
			                        </label>
			                      </div>
			                      <div class="radio">
			                        <label>
			                          <input type="radio" name="false[]" id="optionsRadios3" value="option3" checked="">
			                        </label>
			                      </div>
			                    </div>
	                      	@else
	                      	<div class="form-group">
		                      <div class="radio">
		                        <label>
		                          <input type="radio" name="true[]" id="optionsRadios2" value="1">
		                        </label>
		                      </div>
		                      <div class="radio">
		                        <label>
		                          <input type="radio" name="false[]" id="optionsRadios3" value="option3" checked="">
		                        </label>
		                      </div>
		                    </div>
	                        	<!-- <input name="quiz_answer[{{$temp}}]" type="checkbox" checked="checked">
	                        
	                        	<input name="quiz_answer[{{$temp}}]" type="checkbox" > -->
	                        @endif
	                      </label>
	                    </div>
	                  </td>
	                </tr>
	                <?php $i++; } ?>
	                
	              </table>
	              <br>
	              <input type="submit" name="submit" value="Save" class="btn btn-primary">
	              </form>
	            </div>
	          </div>
	        </div>
	  </div>
	</section>
</div>

@include('layouts/footer')
 @include('layouts/header')
 <!-- <link rel="stylesheet" href="{{URL::to('plugins/datatables/dataTables.bootstrap.css')}}"> -->

  <!-- Left side column. contains the logo and sidebar -->
  
  
  <link rel="stylesheet" href="{{URL::to('bower_components/bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.min.css')}}" />

@include('layouts/teacher_nav')
<div class="content-wrapper">
    <section class="content">

      <div class="row">
      		<div class="col-md-6">
	          <div class="box box-danger">
	            <div class="box-header">
	                <h3 class="box-title">
	                  Submitted Quiz
	                </h3>
	                <div class="box-tools pull-right">
	                  <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
	                </div>
	            </div>
	            <div class="box-body">
	            	<?php $sess = $quiz->session->where('id', $quiz->session_id)->first(); ?>
	            	<b>Session Name : {{$sess->title}}</b><br>
	              <table class="table">
	                <tr>
	                  <th>No</th>
	                  <th>Student username</th>
	                  <th>Created at</th>
	                  <th>Last update</th>
	                  <th>Action</th>
	                </tr>
	                <?php $i=1; 
	                foreach($quiz->quizEnrollments->where('quiz_id', $quiz->id) as $qe){ ?>
	                <tr>
	                  <td>{{$i}}</td>
	                  <?php $user = $qe->user->where('id', $qe->user_id)->first(); ?>
	                  <td>{{$user->username}}</td>
	                  <td>{{ date("d-m-Y H:i:s", strtotime($qe->created_at)) }}</td>
	                  <td>{{ date("d-m-Y H:i:s", strtotime($qe->updated_at)) }}</td>
	                  <td>
	                    <a class="btn btn-warning" href="{{url('quiz/grade-student/'.$qe->quiz_id.'/session/'.$quiz->session_id.'/user/'.$user->id)}}">Grade this </a>
	                  </td>
	                </tr>
	                <?php $i++; } ?>
	                
	              </table>
	            </div>
	          </div>
	        </div>
	  </div>
	</section>
</div>

@include('layouts/footer')
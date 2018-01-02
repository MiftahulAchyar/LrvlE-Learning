 @include('layouts/header')
 <!-- <link rel="stylesheet" href="{{URL::to('plugins/datatables/dataTables.bootstrap.css')}}"> -->
  <!-- Left side column. contains the logo and sidebar -->
  <link rel="stylesheet" href="{{URL::to('bower_components/bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.min.css')}}" />

@include('layouts/teacher_nav')
<div class="content-wrapper">
    <section class="content">

      <div class="row">
      		<div class="col-md-12">
	          <div class="box box-danger">
	            <div class="box-header">
	                <h3 class="box-title">
	                  Submitted Assignment
	                </h3>
	                <div class="box-tools pull-right">
	                  <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
	                </div>
	            </div>
	            <div class="box-body">
	            	<?php $sess = $assignment->session->where('id', $assignment->session_id)->first(); ?>
	            	<b>Session Name : {{$sess->title}}</b><br>
	            	<b>Assignment Name : {{$assignment->title}}</b><br>
	              <table class="table">
	                <tr>
	                  <th>No</th>
	                  <th>Student username</th>
	                  <th>File</th>
	                  <th>Last update</th>
	                  <th>Grade</th>
	                  <th>Action</th>
	                </tr>
	                <?php $i=1; 
	                foreach($studentAssignment as $sA){ ?>
	                <tr>
	                  <td>{{$i}}</td>
	                  <?php $user = $sA->user->where('id', $sA->user_id)->first(); ?>
	                  <td>{{$user->username}}</td>
	                  <td><a href="{{url($sA->file_path)}}" target="_blank">Open file</a> </td>
	                  <td>{{ date("d-m-Y H:i:s", strtotime($sA->updated_at)) }}</td>
	                  <td>{{ $sA->grade}}</td>
	                  <td>
	                  	<form style="display: none" class="edit-grade-{{$sA->id}}" action="{{url('assignment/grade-student')}}" method="post">

        				{{ csrf_field() }}
	                  		<input type="hidden" name="id" value="{{$sA->id}}">
	                  		<input type="hidden" name="assignment_id" value="{{$sA->assignment_id}}">
	                  		<input type="hidden" name="user_id" value="{{$sA->user_id}}">
							<div class="input-group input-group-sm">
			                    <input type="number" class="form-control" min="0" max="100" name="grade" value="{{ $sA->grade}}">
			                    <span class="input-group-btn">
			                      <button class="btn btn-info btn-flat" type="submit">Update</button>
			                    </span>
			                </div>
	                  	</form>
                    	<a class="edit-grade btn btn-warning btn-sm" onclick="change_grade({{$sA->id}}, this)" href="#{{$sA->id}}">Change grade </a>
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

<script type="text/javascript">
	function change_grade(ass_id, element) {
		$('form.edit-grade-'+ass_id).toggle();
		var str = element.innerHTML;
	      if(str == 'Cancel')
	        element.innerHTML = 'Change grade'
	      else
	        element.innerHTML = 'Cancel'
	}
</script>
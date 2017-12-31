<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Quiz extends Model
{
     protected $table = "quiz";

     public function session()
    {
        return $this->belongsTo('App\Session');
    }

     public function questions()
    {
        return $this->hasMany('App\QuizQuestion');
    }

    public function quizEnrollments()
    {
        return $this->hasMany('App\QuizEnrollment');
    }

    public function quizStudentAnswers()
    {
        return $this->hasMany('App\QuizStudentAnswer');
    }

}

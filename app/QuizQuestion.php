<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class QuizQuestion extends Model
{
    protected $table = "quiz_questions";

    public function quiz()
    {
        return $this->belongsTo('App\Quiz');
    }

    public function choiches(){
    	return $this->hasOne("App\QuizMultipleChoice");
    }
    public function quiz_student_answers()
    {
    	return $this->hasMany("App\QuizAnswers");
    }
}

<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class QuizEnrollment extends Model
{
    protected $table = "quiz_enrollments";    
    protected $fillable = ['quiz_id', 'user_id', 'created_id', 'updated_at'];

    public function assingment()
    {
        return $this->belongsTo('App\Quiz');
    }

    public function user()
    {
        return $this->belongsTo('App\User');
    }

}

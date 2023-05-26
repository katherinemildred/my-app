class ApplicationController < ActionController::Base
  before_action(:load_current_student)
  # before_action(:load_subletting_students)
  
  # Uncomment line 5 in this file and line 3 in StudentAuthenticationController if you want to force students to sign in before any other actions.
  
  before_action(:force_student_sign_in) #uncommented
  
  def load_current_student
    the_id = session[:student_id]
    
    @current_student = Student.where({ :id => the_id }).first

  end

  # def load_subletting_students
   # relevant_id= params.fetch(:student_id)
  #  relevant_student= Student.where({:id=>student_id})
   # relevant_student_name = relevant_student.first_name
  #end

  
  def force_student_sign_in
    if @current_student == nil
      redirect_to("/student_sign_in", { :notice => "Silly goose! You have to sign in first. :)" })
    end
  end

end

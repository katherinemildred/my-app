class StudentAuthenticationController < ApplicationController
  # Uncomment line 3 in this file and line 5 in ApplicationController if you want to force students to sign in before any other actions.
  # skip_before_action(:force_student_sign_in, { :only => [:sign_up_form, :create, :sign_in_form, :create_cookie] })

  def sign_in_form
    render({ :template => "student_authentication/sign_in.html.erb" })
  end

  def create_cookie
    student = Student.where({ :email => params.fetch("query_email") }).first
    
    the_supplied_password = params.fetch("query_password")
    
    if student != nil
      are_they_legit = student.authenticate(the_supplied_password)
    
      if are_they_legit == false
        redirect_to("/student_sign_in", { :alert => "Incorrect password." })
      else
        session[:student_id] = student.id
      
        redirect_to("/", { :notice => "Signed in successfully." })
      end
    else
      redirect_to("/student_sign_in", { :alert => "No student with that email address." })
    end
  end

  def destroy_cookies
    reset_session

    redirect_to("/", { :notice => "Signed out successfully." })
  end

  def sign_up_form
    render({ :template => "student_authentication/sign_up.html.erb" })
  end

  def create
    @student = Student.new
    @student.email = params.fetch("query_email")
    @student.password = params.fetch("query_password")
    @student.password_confirmation = params.fetch("query_password_confirmation")
    @student.first_name = params.fetch("query_first_name")
    @student.last_name = params.fetch("query_last_name")
    @student.school_id = params.fetch("query_school_id")
    @student.phone_number = params.fetch("query_phone_number")


    save_status = @student.save

    if save_status == true
      session[:student_id] = @student.id
   
      redirect_to("/", { :notice => "Student account created successfully."})
    else
      redirect_to("/student_sign_up", { :alert => @student.errors.full_messages.to_sentence })
    end
  end
    
  def edit_profile_form
    render({ :template => "student_authentication/edit_profile.html.erb" })
  end

  def update
    @student = @current_student
    @student.email = params.fetch("query_email")
    @student.password = params.fetch("query_password")
    @student.password_confirmation = params.fetch("query_password_confirmation")
    @student.first_name = params.fetch("query_first_name")
    @student.last_name = params.fetch("query_last_name")
    @student.school_id = params.fetch("query_school_id")
    @student.phone_number = params.fetch("query_phone_number")
    
    if @student.valid?
      @student.save

      redirect_to("/", { :notice => "Student account updated successfully."})
    else
      render({ :template => "student_authentication/edit_profile_with_errors.html.erb" , :alert => @student.errors.full_messages.to_sentence })
    end
  end

  def destroy
    @current_student.destroy
    reset_session
    
    redirect_to("/", { :notice => "Student account cancelled" })
  end
 
end

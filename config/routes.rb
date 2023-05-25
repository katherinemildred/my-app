Rails.application.routes.draw do

  get("/",{ :controller => "properties", :action => "index" })

  # Routes for the School resource:

  # CREATE
  post("/insert_school", { :controller => "schools", :action => "create" })
          
  # READ
  get("/schools", { :controller => "schools", :action => "index" })
  
  get("/schools/:path_id", { :controller => "schools", :action => "show" })
  
  # UPDATE
  
  post("/modify_school/:path_id", { :controller => "schools", :action => "update" })
  
  # DELETE
  get("/delete_school/:path_id", { :controller => "schools", :action => "destroy" })

  #------------------------------

  # Routes for the City resource:

  # CREATE
  post("/insert_city", { :controller => "cities", :action => "create" })
          
  # READ
  get("/cities", { :controller => "cities", :action => "index" })
  
  get("/cities/:path_id", { :controller => "cities", :action => "show" })
  
  # UPDATE
  
  post("/modify_city/:path_id", { :controller => "cities", :action => "update" })
  
  # DELETE
  get("/delete_city/:path_id", { :controller => "cities", :action => "destroy" })

  #------------------------------

  # Routes for the Student account:

  # SIGN UP FORM
  get("/student_sign_up", { :controller => "student_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_student", { :controller => "student_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_student_profile", { :controller => "student_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_student", { :controller => "student_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_student_account", { :controller => "student_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/student_sign_in", { :controller => "student_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/student_verify_credentials", { :controller => "student_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/student_sign_out", { :controller => "student_authentication", :action => "destroy_cookies" })
             
  #------------------------------

  # Routes for the Property resource:

  # CREATE
  post("/insert_property", { :controller => "properties", :action => "create" })
          
  # READ
  get("/properties", { :controller => "properties", :action => "index" })
  
  get("/properties/:path_id", { :controller => "properties", :action => "show" })
  
  # UPDATE
  
  post("/modify_property/:path_id", { :controller => "properties", :action => "update" })
  
  # DELETE
  get("/delete_property/:path_id", { :controller => "properties", :action => "destroy" })

  #------------------------------


  get("/contact_students", {:controller=> "students", :action =>"index"})


end

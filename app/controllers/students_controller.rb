class StudentsController < ApplicationController
  def index
    @all_students = Student.all
    @list_of_students = @all_students.order({:first_name => :asc})

    render(:template=>"students/index.html.erb")
  end
end

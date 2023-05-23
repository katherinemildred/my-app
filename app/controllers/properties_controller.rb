class PropertiesController < ApplicationController
  def index
    matching_properties = Property.all

    @list_of_properties = matching_properties.order({ :created_at => :desc })

    render({ :template => "properties/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_properties = Property.where({ :id => the_id })

    @the_property = matching_properties.at(0)

    render({ :template => "properties/show.html.erb" })
  end

  def create
    the_property = Property.new
    the_property.formal_address = params.fetch("query_formal_address")
    the_property.address_description = params.fetch("query_address_description")
    the_property.monthly_rent = params.fetch("query_monthly_rent")
    the_property.date_begins = params.fetch("query_date_begins")
    the_property.subletter_student_id = params.fetch("query_subletter_student_id")
    the_property.city_id = params.fetch("query_city_id")
    the_property.availability_status = params.fetch("query_availability_status")
    the_property.date_end = params.fetch("query_date_end")

    if the_property.valid?
      the_property.save
      redirect_to("/properties", { :notice => "Property created successfully." })
    else
      redirect_to("/properties", { :alert => the_property.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_property = Property.where({ :id => the_id }).at(0)

    the_property.formal_address = params.fetch("query_formal_address")
    the_property.address_description = params.fetch("query_address_description")
    the_property.monthly_rent = params.fetch("query_monthly_rent")
    the_property.date_begins = params.fetch("query_date_begins")
    the_property.subletter_student_id = params.fetch("query_subletter_student_id")
    the_property.city_id = params.fetch("query_city_id")
    the_property.availability_status = params.fetch("query_availability_status")
    the_property.date_end = params.fetch("query_date_end")

    if the_property.valid?
      the_property.save
      redirect_to("/properties/#{the_property.id}", { :notice => "Property updated successfully."} )
    else
      redirect_to("/properties/#{the_property.id}", { :alert => the_property.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_property = Property.where({ :id => the_id }).at(0)

    the_property.destroy

    redirect_to("/properties", { :notice => "Property deleted successfully."} )
  end
end

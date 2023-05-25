# == Schema Information
#
# Table name: properties
#
#  id                   :integer          not null, primary key
#  address_description  :string
#  availability_status  :string
#  date_begins          :date
#  date_end             :date
#  formal_address       :string
#  monthly_rent         :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  city_id              :integer
#  subletter_student_id :integer
#
class Property < ApplicationRecord
  belongs_to(:subletter_student, { :required => true, :class_name => "Student", :foreign_key => "subletter_student_id" })
  belongs_to(:city, { :required => true, :class_name => "City", :foreign_key => "city_id", :counter_cache => true, :required => true})
end

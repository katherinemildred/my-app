# == Schema Information
#
# Table name: schools
#
#  id          :integer          not null, primary key
#  school_name :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  city_id     :integer
#
class School < ApplicationRecord
  belongs_to(:city, { :required => true, :class_name => "City", :foreign_key => "city_id" })
  has_many(:students, { :class_name => "Student", :foreign_key => "school_id"})
end

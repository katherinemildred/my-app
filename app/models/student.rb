# == Schema Information
#
# Table name: students
#
#  id              :integer          not null, primary key
#  email           :string
#  first_name      :string
#  last_name       :string
#  password_digest :string
#  phone_number    :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  school_id       :integer
#
class Student < ApplicationRecord

  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many(:properties, { :class_name => "Property", :foreign_key => "subletter_student_id", :dependent => :destroy })
  
  belongs_to(:school, { :required => true, :class_name => "School", :foreign_key => "school_id" })


end

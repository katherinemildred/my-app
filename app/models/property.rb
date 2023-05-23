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
end

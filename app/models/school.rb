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
end

# == Schema Information
#
# Table name: cities
#
#  id               :integer          not null, primary key
#  city_name        :string
#  properties_count :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class City < ApplicationRecord

  has_many(:properties, { :class_name => "Property", :foreign_key => "city_id", :dependent => :nullify })
  has_many(:schools, { :class_name => "School", :foreign_key => "city_id", :dependent => :nullify })

end

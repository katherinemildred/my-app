class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.string :formal_address
      t.string :address_description
      t.integer :monthly_rent
      t.date :date_begins
      t.integer :subletter_student_id
      t.integer :city_id
      t.string :availability_status
      t.date :date_end

      t.timestamps
    end
  end
end

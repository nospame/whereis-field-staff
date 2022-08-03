class CreateStaffLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :staff_locations do |t|
      t.integer :staff_member_id
      t.string :location_name
      t.string :country_code
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end

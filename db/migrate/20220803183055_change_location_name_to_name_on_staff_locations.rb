class ChangeLocationNameToNameOnStaffLocations < ActiveRecord::Migration[7.0]
  def change
    rename_column :staff_locations, :location_name, :name
  end
end

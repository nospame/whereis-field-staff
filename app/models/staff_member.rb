class StaffMember < ApplicationRecord
  has_many :staff_locations

  # ensure unique emails for staff member
  validates :email, uniqueness: true
end

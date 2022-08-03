Rails.application.routes.draw do
  resources :staff_locations, :staff_members
  
  post "staff_locations/new" => "staff_locations#create"
end

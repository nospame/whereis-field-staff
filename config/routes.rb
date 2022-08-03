Rails.application.routes.draw do
  resources :staff_locations
  
  post "staff_locations/new" => "staff_locations#create"
end

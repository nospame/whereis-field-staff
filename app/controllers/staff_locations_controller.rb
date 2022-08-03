class StaffLocationsController < ApplicationController
  def create
    locations = get_locations(params)

    # add error handling for staff_member lookup, location lookup, staff_location.save

    staff_member_id = StaffMember.find_by(email: params[:email]).id

    staff_location = StaffLocation.new(
      staff_member_id: staff_member_id,
      name: locations[0]["name"],
      country_code: locations[0]["countryCode"],
      lat: locations[0]["lat"],
      lng: locations[0]["lng"]
    )

    if staff_location.save!
      redirect_to "/staff_locations/#{staff_location.id}"
    else
      render json: {errors: "an error occurred"}
    end
    
  end

  # move logic out of controller?
  private
    def get_locations(params)
      base_url = "http://api.geonames.org/search"
      username = "dimagi"
      password = "dimagi"
      name = params[:name]
      country = params[:country]
      type = "json"
      max_rows = 1
      
      response = HTTP.get(base_url + 
        "?name=#{name}" + 
        "&country=#{country}" + 
        "&username=#{username}" +
        "&password=#{password}" +
        "&type=#{type}" +
        "&maxRows=#{max_rows}")
        .parse(:json)

      response["geonames"]
    end
end

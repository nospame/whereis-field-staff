class StaffLocationsController < ApplicationController
  # this line for development only, remove in production
  # skip_before_action :verify_authenticity_token

  def create
    locations = get_locations(params)
    staff_member_id = StaffMember.find_by(email: params[:email]).id
    staff_location = StaffLocation.new(
      staff_member_id: staff_member_id,
      location_name: locations[0]["name"],
      country_code: locations[0]["countryCode"],
      lat: locations[0]["lat"],
      lng: locations[0]["lng"]
    )

    # consider location validation here!

    staff_location.save!
    redirect_to "/#{staff_location.id}"
  end

  # move logic out of controller
  def get_locations(params)
    # base_url = "http://api.geonames.org/search"
    # username = "dimagi"
    # password = "dimagi"
    # name = params[:name]
    # country = params[:country]
    # type = "json"
    # max_rows = 5
    
    # response = HTTP.get("#{base_url}?name=#{name}&country=#{country}&username=#{username}&password=#{password}&type=#{type}&maxRows=#{max_rows}").parse(:json)

    # pp response["geonames"]
    # response["geonames"]

    dummy_response = [
        {
          "adminCode1" => "CA",
          "lng" => "-121.4944",
          "geonameId" => 5389489,
          "toponymName" => "Sacramento",
          "countryId" => "6252001",
          "fcl" => "P",
          "population" => 490712,
          "countryCode" => "US",
          "name" => "Sacramento",
          "fclName" => "city, village,...",
          "adminCodes1" => {
            "ISO3166_2" => "CA"
          },
          "countryName" => "United States",
          "fcodeName" => "seat of a first-order administrative division",
          "adminName1" => "California",
          "lat" => "38.58157",
          "fcode" => "PPLA"
        },
        {
          "adminCode1" => "CA",
          "lng" => "-120.99764",
          "geonameId" => 12213912,
          "toponymName" => "Sacramento-Roseville-Folsom, CA Metro Area",
          "countryId" => "6252001",
          "fcl" => "L",
          "population" => 2150000,
          "countryCode" => "US",
          "name" => "Sacramento-Roseville-Folsom, CA",
          "fclName" => "parks,area, ...",
          "adminCodes1" => {
            "ISO3166_2" => "CA"
          },
          "countryName" => "United States",
          "fcodeName" => "economic region",
          "adminName1" => "California",
          "lat" => "38.78046",
          "fcode" => "RGNE"
        }
      ]
  end
end

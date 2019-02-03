require 'open-uri'

class GeocodingController < ApplicationController
  def street_to_coords
    @street_address = params.fetch("user_street_address")
    sanitized_street_address = URI.encode(@street_address)

    url = "https://maps.googleapis.com/maps/api/geocode/json?address=5807+S+Woodlawn+Ave&key=AIzaSyBr-0XDfztIIUGyPRfa1D5KfPvURvAk2e4"
    parsed_data = JSON.parse(open(url).read)
    lat = parsed_data.dig("results", 0, "geometry", "location", "lat")
    long = parsed_data.dig("results", 0, "geometry", "location", "lng")
 
    @latitude = lat

    @longitude = long

    render("geocoding_templates/street_to_coords.html.erb")
  end

  def street_to_coords_form
    render("geocoding_templates/street_to_coords_form.html.erb")
  end
end

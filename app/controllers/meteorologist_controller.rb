require 'open-uri'

class MeteorologistController < ApplicationController
  def street_to_weather
    @street_address = params.fetch("user_street_address")
    sanitized_street_address = URI.encode(@street_address)

     url1 = "https://maps.googleapis.com/maps/api/geocode/json?address=" + @street_address.to_s + "&key=AIzaSyBr-0XDfztIIUGyPRfa1D5KfPvURvAk2e4"
    parsed_data_street = JSON.parse(open(url1).read)
    lat = parsed_data_street.dig("results", 0, "geometry", "location", "lat")
    long = parsed_data_street.dig("results", 0, "geometry", "location", "lng")
    
       url = "https://api.darksky.net/forecast/8237bf7229ea18173816ae7ffe2da7cd/" + lat.to_s + "," + long.to_s
       parsed_data_weather = JSON.parse(open(url).read)


   
    @current_temperature = parsed_data_weather.dig("currently", "temperature")

    @current_summary = parsed_data_weather.dig("currently", "summary")

    @summary_of_next_sixty_minutes = parsed_data_weather.dig("minutely", "summary")

    @summary_of_next_several_hours = parsed_data_weather.dig("hourly", "summary")

    @summary_of_next_several_days = parsed_data_weather.dig("daily", "summary")

    render("meteorologist_templates/street_to_weather.html.erb")
  end

  def street_to_weather_form
    render("meteorologist_templates/street_to_weather_form.html.erb")
  end
end

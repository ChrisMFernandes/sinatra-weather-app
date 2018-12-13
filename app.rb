require 'sinatra'
require 'curb'
require 'json'
require 'pp'

get '/' do
  city = params[:city]
  req = Curl::Easy.perform("http://api.openweathermap.org/data/2.5/weather?q=#{city}&units=imperial&appid=#{ENV['OPENWEATHER_API_KEY']}")
  res = req.body_str
  @data = JSON.parse(res)
  erb :index
end



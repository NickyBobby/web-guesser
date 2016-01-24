require 'sinatra'
require 'sinatra/reloader'

get '/' do
  rand_num = rand(101)
  "THE PASSWORD IS #{rand_num}!!!!!"
end

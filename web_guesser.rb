require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
  guess = params["guess"].to_i
  cheat = params["cheat"]
  message = check_guess(guess)
  cheat_message = check_for_cheat(cheat)
  color = check_guess_for_color(guess)
  erb :index, :locals => {:message => message,
                          :color => color,
                          :cheat_message => cheat_message
                         }
end

def check_guess(guess)
  if guess >= SECRET_NUMBER + 5
    "Way too high!"
  elsif guess > SECRET_NUMBER
    "Too high!"
  elsif guess == SECRET_NUMBER
    "The SECRET NUMBER is #{SECRET_NUMBER}"
  elsif guess <= SECRET_NUMBER - 5
    "Way too low!"
  elsif guess < SECRET_NUMBER
    "Too low!"
  end
end

def check_guess_for_color(guess)
  if guess >= SECRET_NUMBER + 5
    "red"
  elsif guess > SECRET_NUMBER
    "pink"
  elsif guess == SECRET_NUMBER
    "white"
  elsif guess <= SECRET_NUMBER - 5
    "red"
  elsif guess < SECRET_NUMBER
    "pink"
  end
end

def check_for_cheat(cheat)
  if cheat
    "The SECRET NUMBER is #{SECRET_NUMBER}"
  end
end

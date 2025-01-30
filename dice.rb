require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')




get("/dice/2/6") do

  dice1 = rand(1..6)
  dice2 = rand(1..6)
  sum = dice1 + dice2

  @outcome = "You rolled a #{dice1} and a #{dice2} for a total of #{sum}"

  erb(:two_six)
end

get ("/dice/2/10") do 
  dice1 = rand(1..10)
  dice2 = rand(1..10)
  sum = dice1 + dice2
  @outcome = "You rolled a #{dice1} and a #{dice2} for a total of #{sum}"

  erb(:two_ten)
end

get ("/dice/1/20") do
  @dice = rand(1..20)
  @outcome = "You rolled a #{@dice}"

  erb(:one_twenty)
end  

get("/") do
  erb(:elephant)
end

require "sinatra"
require "sinatra/reloader"

get("/howdy") do
  erb(:hello)
end

get("/goodbye") do
  erb(:bye)
end

get("/") do
  erb(:homepage)
end

# square with form
get("/square/new") do
  erb(:new_square_calc)
end

get("/square/results") do
  @the_num = params.fetch("users_number").to_f

  @the_result = @the_num ** 2
  erb(:square_results)
end

#square root with form
get("/square_root/new") do
  erb(:new_square_root)
end

get("/square_root/results") do
  @the_num = params.fetch("users_number").to_f

  @the_result = @the_num ** 0.5
  erb(:square_root_results)
end

#payment
get("/payment/new") do
  erb(:payment)
end

get("/payment/results") do
  @the_apr = params.fetch("apr_num").to_f

  @the_years = params.fetch("years")

  @the_principal = params.fetch("principal").to_f

  @apr_as_percent = @the_apr / 100

  #use this r
  @apr_as_monthly = @apr_as_percent / 12

  #use this n
  @loan_term = @the_years.to_i * 12

  @numerator = @apr_as_monthly * @the_principal

  @denominator = 1 - (1 + @apr_as_monthly) ** (-@loan_term)

  @result = @numerator / @denominator

  erb(:payments_results)
end

#random
get("/random/new") do
  erb(:random)
end

get("/random/results") do
  @min = params.fetch("minimum").to_f
  @max = params.fetch("maximum").to_f

  @result = rand(@min..@max)

  erb(:random_results)
end

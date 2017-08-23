require "sinatra"
enable :sessions


get '/' do
	erb :pizza
end

post '/pizza' do
	session[:size] = params[:size]
	session[:crust] = params[:crust]
	session[:sauce] = params[:sauce]
	session[:meats] = params[:meats]
	session[:veggies] = params[:veggies]
	session[:cheese] = params[:cheese]
	redirect "/confirm"
end

get '/confirm' do
	erb :confirm, locals:{size:session[:size], crust:session[:crust], sauce:session[:sauce], meats:session[:meats], veggies:session[:veggies], cheese:session[:cheese]}
end

post '/confirm' do
	session[:size] = params[:size]
	session[:crust] = params[:crust]
	session[:sauce] = params[:sauce]
	session[:meats] = params[:meats]
	session[:veggies] = params[:veggies]
	session[:cheese] = params[:cheese]
	session[:lastname] = params[:lastname]
	session[:delivery] = params[:delivery]
	session[:address] = params[:address]
	session[:sauce] = sauce.values
	session[:meats] = meats.values
	session[:veggies] = veggies.values
	redirect "/results"
end

get '/results' do
	erb :results, locals:{size:session[:size], crust:session[:crust], sauce:session[:sauce], meats:session[:meats], veggies:session[:veggies], cheese:session[:cheese], delivery:session[:delivery], address:session[:address], lastname:session[:lastname]}
end

post '/results' do
	session[:size] = params[:size]
	session[:crust] = params[:crust]
	session[:sauce] = params[:sauce]
	session[:meats] = params[:meats]
	session[:veggies] = params[:veggies]
	session[:cheese] = params[:cheese]
	session[:lastname] = params[:lastname]
	session[:delivery] = params[:delivery]
	session[:address] = params[:address]
	redirect '/'
end
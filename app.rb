require "sinatra"
enable :sessions


get '/' do
	session[:total] = nil
	erb :pizza
end

post '/pizza' do
	price = 0
	session[:size] = params[:size]
	if session[:size] == "small"
		price += 4
	elsif session[:size] == "medium"
		price += 5
	elsif session[:size] == "large"
		price += 7
	else session[:size] == "x-large"
		price += 9
	end
	if session[:total] == nil
		session[:total] = []
		session[:total] << price
	else
		session[:total] << price
	end
	localtotal = session[:total]
	if localtotal == nil
		session[:carried] = []
		session[:carried] << localtotal.flatten
	else
		session[:carried] << localtotal.flatten
	end

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
	sauce = params[:sauce]
	meats = params[:meats]
	veggies = params[:veggies]
	session[:cheese] = params[:cheese]
	session[:lastname] = params[:lastname]
	session[:delivery] = params[:delivery]
	session[:address] = params[:address]
	if sauce == nil
	else
	session[:sauce] = sauce.values
	end
	if meats == nil
	else
	session[:meats] = meats.values
	end
	if veggies == nil
	else
	session[:veggies] = veggies.values
	end
	redirect "/results"
end

get '/results' do
	erb :results, locals:{size:session[:size], crust:session[:crust], sauce:session[:sauce], meats:session[:meats], veggies:session[:veggies], cheese:session[:cheese], delivery:session[:delivery], address:session[:address], lastname:session[:lastname]}
end

post '/results' do
		pizsa = params[:pizza]
		if session[:pizzatotal] == nil
			session[:pizzatotal] = []
			session[:pizzatotal] << pizsa
		else
			session[:pizzatotal] << pizsa
		end
	redirect '/'
end

get '/checkout' do
	erb :checkout, locals:{pizza:session[:pizza], pizzatotal:session[:pizzatotal], carried:session[:carried]}
	end 

post '/checkout' do
	pizsa = params[:pizza]
	pizzas = []
	pizzas << pizsa
	session[:pizza] = pizzas
	redirect '/checkout'
end
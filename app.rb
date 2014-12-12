require 'sinatra' 
require 'sinatra/reloader' if development?
require 'rubygems'
require 'data_mapper'
require 'pp'
require 'restclient'
require 'xmlsimple'

configure :development, :test do
	DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/db/aditives.db")
	DataMapper::Logger.new($stdout, :debug)
	DataMapper::Model.raise_on_save_failure = true 

	require_relative 'model'

	DataMapper.finalize

	#DataMapper.auto_migrate!
	DataMapper.auto_upgrade!
end

get '/' do
	erb :index
end

get '/ejemplos' do
	erb :ejemplos
end

post '/ejemplos' do
	puts "Inside post /ejemplos"
	bus = params[:busqueda].upcase

	@consulta = Aditivos.busqueda(bus)
	puts "busqueda = #{bus}"
	
	
	erb :ejemplos
end

get '/db' do

	

end

post '/' do

	

end

get '/actualizar' do

	xml = RestClient.get "https://raw.githubusercontent.com/alu0100700435/MyOpenData/master/public/aditivos.xml" 
	datos = XmlSimple.xml_in(xml.to_s)['aditivo']

	datos.each do |i|
		num = i["numero"].to_s.delete "[\"]"
		puts "#{i["nombre"]}"
		nombre = i["nombre"].to_s.delete "[\"]"
		tox = i["toxicidad"].to_s.delete "[\"]"

		@info = Aditivos.first_or_create(:numero  => num, :name => nombre, :toxicidad => tox)
		
	end
	
end


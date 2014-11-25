require 'dm-core'
require 'dm-migrations'

class Aditivos
	include DataMapper::Resource
		property :id, Serial
		property :name, String 
		
end
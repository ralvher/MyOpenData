require 'dm-core'
require 'dm-migrations'

class Aditivos
	include DataMapper::Resource
		property :id, Serial
		property :numero, String, :key => true
		property :name, String 
		property :toxicidad, String
		
end
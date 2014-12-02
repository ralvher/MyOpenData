require 'dm-core'
require 'dm-migrations'

class Aditivos
	include DataMapper::Resource
		property :id, Serial
		property :numero, String, :key => true
		property :name, Text 
		property :toxicidad, String
		
end
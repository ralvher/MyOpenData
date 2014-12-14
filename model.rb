require 'dm-core'
require 'dm-migrations'

class Aditivo
	include DataMapper::Resource
	property :id, Serial
	property :numero, String, :key => true
	property :name, Text
	property :toxicidad, String, :key => true
	
	has n, :producto
end

class Producto
	include DataMapper::Resource
	property :id, Serial
	property :nombre, Text
	
	belongs_to :aditivo
	
	def self.relacion(id)
    	DataMapper.repository.adapter.select("Select  aditivo_toxicidad, count(*) as count from productos where UPPER(nombre) like '%#{id}%' group by  aditivo_toxicidad")
  	end
end


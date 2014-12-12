require 'dm-core'
require 'dm-migrations'

class Aditivos
	include DataMapper::Resource
	property :id, Serial
	property :numero, String, :key => true
	property :name, Text
	property :toxicidad, String

	def self.busqueda(id)
		repository(:default).adapter.select("SELECT * FROM Aditivos WHERE UPPER(numero) like '%#{id}%' OR UPPER(name) like '%#{id}%' OR UPPER(toxicidad) like '%#{id}%'")
	end

	
end

class Productos
	include DataMapper::Resource
	property :id, Serial
	property :nombre, Text
	property :name, String

	def self.relacion(nombre)
		repository(:default).adapter.select("SELECT * FROM Productos NATURAL JOIN Aditivos WHERE UPPER(nombre)='%#{nombre}%' ")
	end


end

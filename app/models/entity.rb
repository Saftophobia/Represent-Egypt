class Entity < ActiveRecord::Base
	validates :name, :presence => true, length: { in: 6..20 }
	validates :type, :presence => true 
	validates :lat, :presence => true, length: { in: 22..32 } 
	validates :lon, :presence => true, length: { in: 25..35 }
	validates :url, :presence => true, length: { in: 6..20 }
	validates :address, :presence => true
	validates :year_estab, :presence => true
	
end

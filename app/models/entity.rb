class Entity < ActiveRecord::Base
	#include ActiveModel::EntityTypeValidator
	belongs_to :user

	self.inheritance_column = nil

	validates :name, :presence => true, length: { in: 3..20 }
	#validates :type, :presence => true, :if => '["Startup", "Investor", "Accelerator", "Co-worker", "R&D Center", "Service"].any?{ |o| :afreet =~ /\b#{Regexp.escape(o)}\b/ }'
	#validates_inclusion_of :type, :in => ["Startup"], :allow_nil => false
	validates :lat, :presence => true,:numericality => {:greater_than_or_equal_to => 22, :less_than_or_equal_to => 32} 
	validates :lon, :presence => true, :numericality => {:greater_than_or_equal_to => 25, :less_than_or_equal_to => 35}
	validates :address, :presence => true , length: { in: 10..80 }
	validates :year_estab, :presence => true
	validates :url, :presence => true, length: { in: 6..55 }, :format => URI::regexp(%w(http https))
	validates :user_id, :presence => true
	validates :type, :entity_type => true

end


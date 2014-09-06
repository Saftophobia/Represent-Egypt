class PagesController < ApplicationController
	before_action :authenticate_user!

	def home
		@startups = Entity.where('type LIKE ?', '%startup%').where(:admin_verification => true).all
    @investors = Entity.where('type LIKE ?', '%investor%').where(:admin_verification => true).all
    @accelerators = Entity.where('type LIKE ?', '%Accelerator%').where(:admin_verification => true).all
    @coworking = Entity.where('type LIKE ?', '%work%').where(:admin_verification => true).all
    @rdcenters = Entity.where(['type LIKE ?', '%center%']).where(:admin_verification => true).all
    @services = Entity.where('type LIKE ?', '%services%').where(:admin_verification => true).all
    
		@startups_hash = Gmaps4rails.build_markers(@startups) do |entity, marker|
  			marker.lat entity.lat
  			marker.lng entity.lon
  			marker.infowindow "<b> hello! <b> "
  			marker.picture ({
            :url => "assets/icons/startup.png", 
            :width => 31, 
            :height => 42
            })
            marker.title entity.name
		end

    @investors_hash = Gmaps4rails.build_markers(@investors) do |entity, marker|
        marker.lat entity.lat
        marker.lng entity.lon
        marker.infowindow "<b> hello! <b> "
        marker.picture ({
            :url => "assets/icons/investor.png", 
            :width => 31, 
            :height => 42
            })
            marker.title entity.name
    end

    @accelerators_hash = Gmaps4rails.build_markers(@accelerators) do |entity, marker|
        marker.lat entity.lat
        marker.lng entity.lon
        marker.infowindow "<b> hello! <b> "
        marker.picture ({
            :url => "assets/icons/accelerator.png", 
            :width => 31, 
            :height => 42
            })
            marker.title entity.name
    end

    @coworking_hash = Gmaps4rails.build_markers(@coworking) do |entity, marker|
        marker.lat entity.lat
        marker.lng entity.lon
        marker.infowindow "<b> hello! <b> "
        marker.picture ({
            :url => "assets/icons/coworking.png", 
            :width => 31, 
            :height => 42
            })
            marker.title entity.name
    end

    @rdcenters_hash = Gmaps4rails.build_markers(@rdcenters) do |entity, marker|
        marker.lat entity.lat
        marker.lng entity.lon
        marker.infowindow "<b> hello! <b> "
        marker.picture ({
            :url => "assets/icons/incubator.png", 
            :width => 31, 
            :height => 42
            })
            marker.title entity.name
    end

    @services_hash = Gmaps4rails.build_markers(@services) do |entity, marker|
        marker.lat entity.lat
        marker.lng entity.lon
        marker.infowindow "<b> hello! <b> "
        marker.picture ({
            :url => "assets/icons/service.png", 
            :width => 31, 
            :height => 42
            })
            marker.title entity.name
    end
	end
end

class Character < ActiveRecord::Base
	acts_as_gmappable 
	
	def gmaps4rails_address 
		address
	end
	
	def gmaps4rails_infowindow
		name
        end
    
        def gmaps4rails_title
		address
        end
	
	def gmaps4rails_marker_picture
	{
		"picture" =>"images/icon_construction.png" ,          # string, mandatory
		"width" => 40 ,          # string, mandatory
		"height" => 40,          # string, mandatory
		#"marker_anchor" => ,   # array, facultative
		#"shadow_picture" => ,  # string, facultative
		#"shadow_width" => ,    # string, facultative
		#"shadow_height" => ,   # string, facultative
		#"shadow_anchor" => ,   # string, facultative
  }
end
	
end

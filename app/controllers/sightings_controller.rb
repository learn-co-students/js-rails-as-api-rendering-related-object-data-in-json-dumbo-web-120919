class SightingsController < ApplicationController
    
    def index
        sightings = Sighting.all 
        render json: sightings.to_json(include: [:bird, :location])
    end
    
    
    def show
        sighting = Sighting.find_by(id: params[:id])
        if sighting
            render json: sighting.to_json(include: [:bird, :location])
        else
            render json: { message: "Ain't no sighting with that id 'round here"}
            
        end
    end
end

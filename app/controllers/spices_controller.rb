class SpicesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found


    def index
        spices= Spice.all
        render json: spices
    end
  
  
    # def show 
    #     spice = find_spice_by_id
    #     render json: spice
    # end
  
  
    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end
  
    def update
        spice = find_spice_by_id
        spice.update(spice_params)
        render json: spice
    end
  
    def destroy
        spice = find_spice_by_id
        spice.destroy
        head :no_content
    end
  
    def spice_params
      params.permit(:title, :image, :description, :notes, :rating)
    end

    def find_spice_by_id
        spice = Spice.find_by(id: params[:id])
    end

    def render_not_found
        render json: {error: "not found"}, status: :not_found
    end


end
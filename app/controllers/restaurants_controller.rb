class RestaurantsController < ApplicationController

    def index
    end

    def show
    end

    def create
    end

    def update
    end

    def destroy
    end

    private

    def find_restaurant
        Bird.find(params[:id])
    end
    
    def restaurant_params
        params.permit(:name, :address)
    end
end

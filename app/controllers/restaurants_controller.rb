class RestaurantsController < ApplicationController

    def index
        render json: Restaurant.all
    end

    def show
        restaurant = find_restaurant
        render json: restaurant
    end

    def create
        restaurant = Restaurant.create(restaurant_params)
        render json: restaurant
    end

    def update
    end

    def destroy
    end

    private

    def find_restaurant
        Restaurant.find(params[:id])
    end
    
    def restaurant_params
        params.permit(:name, :address)
    end
end

class RestaurantsController < ApplicationController
    def index
        render json: Restaurant.all, only: [:id, :name, :address]
    end

    def show
        render json: find_restaurant.as_json(include: { pizzas: { only: [:id, :name, :ingredients] } }, except: [:created_at, :updated_at])
    end

    def create
        render json: Restaurant.create!(restaurant_params), status: :created
    end

    def update
        restaurant = find_restaurant
        restaurant.update!(restaurant_params)
        render json: restaurant, status: :created
    end

    def destroy
        restaurant = find_restaurant
        restaurant.destroy
        head :no_content
    end

    private

    def restaurant_params
        params.permit(:name, :address)
    end

    def find_restaurant
        Restaurant.find(params[:id])
    end
end

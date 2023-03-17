class RestaurantPizzasController < ApplicationController
    def index
        render json: RestaurantPizza.all, only: [:id, :price, :pizza_id, :restaurant_id]
    end

    def show
        render json: find_restaurant_pizza, except: [:created_at, :updated_at]
    end

    def create
        render json: RestaurantPizza.create!(restaurant_pizza_params), status: :created
    end

    def update
        restaurant_pizza = find_restaurant_pizza
        restaurant_pizza.update!(restaurant_pizza_params)
        render json: restaurant_pizza, status: :created
    end

    def destroy
        restaurant_pizza = find_restaurant_pizza
        restaurant_pizza.destroy
        head :no_content
    end

    private

    def restaurant_pizza_params
        params.permit(:price, :pizza_id, :restaurant_id)
    end

    def find_restaurant_pizza
        RestaurantPizza.find(params[:id])
    end
end

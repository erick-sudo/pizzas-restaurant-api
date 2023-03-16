class RestaurantPizzasController < ApplicationController
    def index
        render json: RestaurantPizza.all
    end

    def show
        res_pizza = find_restaurant_pizza
        render json: res_pizza
    end

    def create
        res_pizza = RestaurantPizza.create!(restaurant_pizza_params)
        render json: res_pizza
    end

    def update
    end

    def destroy
    end

    private

    def find_restaurant_pizza
        RestaurantPizza.find(params[:id])
    end
    
    def restaurant_pizza_params
        params.permit(:price, :pizza_id, :restaurant_id)
    end
end

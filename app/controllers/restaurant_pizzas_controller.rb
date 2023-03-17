class RestaurantPizzasController < ApplicationController
    def index
        render json: RestaurantPizza.all, only: [:price, :pizza_id, :restaurant_id]
    end

    def show
        render json: find_restaurant_pizza, except: [:created_at, :updated_at, :id]
    end

    def create
        render json: RestaurantPizza.create!(restaurant_pizza_params).as_json(include: {pizza: { except: [:created_at, :updated_at] } }, only: [])["pizza"], status: :created
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

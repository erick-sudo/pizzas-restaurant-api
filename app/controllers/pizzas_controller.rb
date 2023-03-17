class PizzasController < ApplicationController
    
    def index
        render json: Pizza.all, only: [:id, :name, :ingredients]
    end

    def show
        render json: find_pizza, except: [:created_at, :updated_at]
    end

    def create
        render json: Pizza.create!(pizza_params), status: :created
    end

    def update
        pizza = find_pizza
        pizza.update!(pizza_params)
        render json: pizza, status: :created
    end

    def destroy
        pizza = find_pizza
        pizza.destroy
        head :no_content
    end

    private

    def pizza_params
        params.permit(:name, :ingredients)
    end

    def find_pizza
        Pizza.find(params[:id])
    end
end
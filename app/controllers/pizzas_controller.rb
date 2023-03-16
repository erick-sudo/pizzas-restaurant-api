class PizzasController < ApplicationController
    def index
        render json: Pizza.all
    end

    def show
        pizza = find_pizza
        render json: pizza
    end

    def create
        pizza = Pizza.create(pizza_params)
        render json: pizza
    end

    def update
    end

    def destroy
    end

    private

    def find_pizza
        Pizza.find(params[:id])
    end
    
    def pizza_params
        params.permit(:name, :ingredients)
    end
end

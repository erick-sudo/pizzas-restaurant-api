class PizzasController < ApplicationController
    def index
        render json: Pizza.all
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

    def find_pizza
        Bird.find(params[:id])
    end
    
    def pizza_params
        params.permit(:name, :address)
    end
end

class Api::RestaurantsController < ApplicationController
  def index
    @restaurant = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save!
      render :show
    else
      render json: @restaurant.errors.full_messages, status: 422
    end
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    if @restaurant.update_attributes(restaurant_params)
      render :show
    else
      render json: @restaurant.errors.full_messages, status: 404
    end
  end

  def edit
    render :edit
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def destroy
    restaurant = Restaurant.find(params[:id])
    restaurant.destroy!
    render json: :show # should this be index?
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :phone_number, :website_link, :hours, :dining_style, :dress_code, :executive_chef, :price_range, :private_party_facilities, :private_party_contact)
  end
end

class Api::V1::Admin::ItemsController < Api::ApiController
  respond_to :json

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(params[:id])
  end

  def create
    category = Category.find_by(name: item_params[:category])
    respond_with category.items << Item.create(name: item_params[:name],
                        description: item_params[:description],
                        price: item_params[:price]), location: nil
  end

  def update
    respond_with Item.update(params[:id], item_params)
  end

  def destroy
    respond_with Item.delete(params[:id]), nil
  end

  private
  def item_params
    params.permit(:name, :description, :price, :category)
  end
end

class Api::V1::Admin::CategoriesController < Api::ApiController
  respond_to :json

  def index
    respond_with Category.all
  end

  def show
    respond_with Category.find(params[:id]), :include => [:items]
  end

  def create
    respond_with Category.create(category_params), location: nil
  end

  def update
    respond_with Category.update(params[:id], category_params)
  end

  def destroy
    respond_with Category.delete(params[:id]), nil
  end

  private
  def category_params
    params.permit(:name)
  end
end

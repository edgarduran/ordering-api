class Api::V1::CategoriesController < ApplicationController
  respond_to :json

  def index
    respond_with Category.all
  end

  def show
    respond_with Category.find(params[:id]), :include => [:items]
  end

end

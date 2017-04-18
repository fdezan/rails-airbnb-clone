class ServicesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @categories = Service::CATEGORIES
  end

  def index
    @services = Service.where(category: params[:category])
  end


  def show
  end

  def create
  end

  def new
  end

  def delete
  end

  def update
  end

end

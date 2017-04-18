class MyServicesController < ApplicationControlle
  before_action :set_my_service, only: [:show, :edit, :update, :destroy]

  def index
    @my_service = current_user.my_services
  end

  def new
    @my_service = Service.new
  end

  def create
    @my_service = Service.new()
  end

  def update
    @my_service.update()
    redirect_to something_path()
  end

  def show
  end

  def edit
  end

  def destroy
  end

  private

  def set_my_service
    @my_service = Service.find(params[:algumas_coisa_id])
  end
end

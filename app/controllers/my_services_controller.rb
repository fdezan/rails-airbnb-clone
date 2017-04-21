class MyServicesController < ApplicationController
  before_action :set_my_service, only: [:show, :edit, :update, :destroy]

  def index
    @my_services = current_user.services
  end

  def new
    @my_service = Service.new
  end

  def create
    @my_service = current_user.services.new(my_service_params)
    if @my_service.save
      flash[:notice] = "#{@my_service.description} adicionado"
      redirect_to my_service_path(@my_service)
    else
      render :new
    end
  end

  def update
    if @my_service.update(my_service_params)
      redirect_to my_service_path(@my_service)
    else
      render :edit
    end
  end

  def show
  end

  def edit
  end

  def recuse
    @proposal = Proposal.find(params[:id])
    @proposal.status = "Declined"
  end


  def destroy
    @my_service.destroy
    redirect_to my_services_path
  end

  private

  def set_my_service
    @my_service = Service.find(params[:id])
  end

  def my_service_params
      # *Strong params*: You need to *whitelist* what can be updated by the user
      # Never trust user data!
      params.require(:service).permit(:description, :category, photos: [])
  end

end

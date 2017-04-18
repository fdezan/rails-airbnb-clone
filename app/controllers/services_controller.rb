class ServicesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @categories = Service::CATEGORIES
  end

  def index
    @services = Service.where(category: params[:category])
  end


  # def new
  #   @service = Service.new
  # end

  # def create
  #   @service = Service.new(service_params)
  #   if @service.save
  #     flash[:notice] = "#{@service.description} adicionado"
  #     redirect_to new_service_path
  #   else
  #     render :new
  #   end
  # end

  # def destroy
  #   @service = Service.find(params[:id])
  #   @service.destroy
  #   redirect_to services_path(category: @service.category)
  # end

  def show
    @service = Service.find(params[:id])
    @proposal = @service.proposals.new(user: current_user)
  end

  # private

  # def service_params
  #   # *Strong params*: You need to *whitelist* what can be updated by the use
  #   # Never trust user data!
  #   params.require(:service).permit(:description, :category)
  # end
end

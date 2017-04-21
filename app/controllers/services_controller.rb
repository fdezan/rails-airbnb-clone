class ServicesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index]

  def home
    @categories = Service::CATEGORIES
  end

  def index
    @services = Service.where(category: params[:category])

    @services_with_address = @services.joins(:user).where.not("users.latitude is null and users.longitude is null")

    # @users = @services.map(&:user)

    @hash = Gmaps4rails.build_markers(@services_with_address) do |service, marker|
      marker.lat service.user.latitude
      marker.lng service.user.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
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
    @proposal_list = Proposal.where( service_id: @service )
  end

  # private

  # def service_params
  #   # *Strong params*: You need to *whitelist* what can be updated by the use
  #   # Never trust user data!
  #   params.require(:service).permit(:description, :category)
  # end
end


class ProposalsController < ApplicationController
  before_action :set_proposal, only: [:show ]

  # permite nao repetir a mesma coisa em varios metodos

  def index
    @service = Service.find(params[:service_id])
    @proposals = @service.proposals
  end

  def show
  end

  def new
    @proposal = Proposal.new
  end

  def create
    @proposal = Proposal.new(proposal_params)
    @proposal.user = current_user
    if @proposal.save
      flash[:notice] = "#{@proposal.description} adicionado"
      @proposal.status = "New"
      @proposal.save
      redirect_to my_proposal_path(@proposal)
    else
      render :new
    end
  end

  # def edit
  #   # @proposal = Proposal.find(params[:id])
  # end

  # def update
  #    # @proposal = proposal.find(params[:id])
  #   # @proposal.update(proposal_params)
  #   # redirect_to proposal_path(@proposal)
  # end

  # def destroy
  #   # @proposal = Proposal.find(params[:id])
  # end

  def finish
  end

  private

  def set_proposal
    @proposal = Proposal.find(params[:service_id])
  end

  def proposal_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:proposal).permit(:description, :service_id, :user_id, photos: [])
  end
end

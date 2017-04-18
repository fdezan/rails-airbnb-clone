class ProposalsController < ApplicationController
  before_action :set_proposal, only: [:show, :edit, :update, :destroy]
  # permite nao repetir a mesma coisa em varios metodos

  def index
    @proposals = Proposal.where(service_id: params[:service_id])
  end

  def show
    # @proposal = Proposal.find(params[:id])
  end

  def new
    @proposal = Proposal.new
  end

  def create
    @proposal = Proposal.new(proposal_params)
    @proposal.save
    redirect_to service_proposal_path(@proposal)
  end

  private

  def set_proposal
    @proposal = Proposal.find(params[:service_id])
  end

  def proposal_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:).permit(:)
  end
end

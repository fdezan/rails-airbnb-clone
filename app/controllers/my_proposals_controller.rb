class MyProposalsController < ApplicationController
  before_action :set_my_proposal, only: [:edit, :update, :destroy]

  def index
    @my_proposals = current_user.proposals
  end

  def show
    @my_proposal = Proposal.find(params[:id])
    #@service = Service.find(params[:id])
  end

  def edit
    @service = @my_proposal.service
  end

  def update
    @my_proposal = Proposal.find(params[:id])
    if @my_proposal.update_attributes(my_proposal_params)
      redirect_to my_proposal_path(@my_proposal)
    else
      render :edit
    end
  end

  def destroy
    @my_proposal.destroy
    redirect_to my_proposals_path
  end

  def finish
  end

  private

  def set_my_proposal
    @my_proposal = current_user.proposals.find(params[:id])
  end

  def my_proposal_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:proposal).permit(:description, photos: [])
  end
end

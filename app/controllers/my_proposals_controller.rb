class MyProposalsController < ApplicationController
  before_action :set_my_proposal, only: [:edit, :update, :destroy]

  def index
    @my_proposals = current_user.proposals
  end

  def show
    @my_proposal = Proposal.find(params[:id])
  end

  def edit
    @service = @my_proposal.service
  end

  def update
    @my_proposal.update(my_proposal_params)
    redirect_to my_proposals_path
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
    params.require(:restaurant).permit(:name, :address, :category)
  end
end

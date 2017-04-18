class ReceivedProposalsController < ApplicationControlle
  before_action :set_received_proposal, only: [:show, :accept, :decline]

  def index
    @received_proposals = current_user.received_proposals
  end

  def show
  end

  def accept
  end

  def decline
  end

  private

  def set_received_proposal
    @received_proposal = Proposal.find(params[:algumas_coisas_id])
  end
end

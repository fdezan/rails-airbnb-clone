class ReceivedProposalsController < ApplicationController
  before_action :set_received_proposal, only: [:show, :accept, :decline]

  def index
    @my_services = current_user.services

  end

  def show

  end

  def accept
    @proposal = Proposal.find(params[:id])
    @proposal.status = "Accepted"
    @proposal.save
    else
  end

  def decline
    @proposal = Proposal.find(params[:id])
    @proposal.status = "Declined"
    @proposal.save
  end

  def finish
    @proposal = Proposal.find(params[:id])
    @proposal.status = "Finished"
    @proposal.save
  end

  private

  def set_received_proposal
    @received_proposal = current_user.received_proposals.find(params[:id])
  end
end


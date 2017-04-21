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
    redirect_to my_service_path(@proposal.service)
  end

  def decline
    @proposal = Proposal.find(params[:id])
    @proposal.status = "Declined"
    @proposal.save
    redirect_to my_service_path(@proposal.service)
  end

  def finish
    @proposal = Proposal.find(params[:id])
    @proposal.status = "Finished"
    @proposal.save
    redirect_to my_service_path(@proposal.service)
  end

  private

  def set_received_proposal
    @received_proposal = current_user.received_proposals.find(params[:id])
  end
end


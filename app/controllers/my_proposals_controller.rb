class MyProposalsController < ApplicationController
  before_action :set_my_proposal, only: [:show, :edit, :update, :destroy]

  def index
    @my_proposals = current_user.proposals
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def finish
  end

  private

  def set_my_proposal
    @my_proposal = current_user.proposals.find(params[:id])
  end
end

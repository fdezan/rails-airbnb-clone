class ProposalsController < ApplicationControlle
  before_action :set_proposal, only: [:show ]
  # permite nao repetir a mesma coisa em varios metodos

  def index
    @proposals = Proposal.all
  end

  def show
  end

  def new
    @proposal = Proposal.new
  end

  def create
    @proposal = Proposal.new(proposal_params)
    if @proposal.save
    flash[:notice] = "#{@proposal.description} adicionado"
    redirect_to proposal_path(@proposal)
    else
      render :new
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
    @proposal = Proposal.find(params[:id])
  end

  def proposal_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:).permit(:description, photos: [])
  end
end

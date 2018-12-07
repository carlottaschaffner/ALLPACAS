class AlpacasController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @alpacas = policy_scope(Alpaca).order(created_at: :desc)
  end

  def show
    @alpaca = Alpaca.find(params[:id])
    authorize @alpaca
  end

  def dashboard
    #this is not secure - but were going to role with it for now
    authorize @alpacas = current_user.alpacas
  end

end

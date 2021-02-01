class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: %i[show edit update destroy toggle_status]

  # GET /portfolios
  def index
    @portfolio_items = Portfolio.all
  end

  # GET /portfolio/:id
  def show; end

  # GET /portfolios/new
  def new
    @portfolio_item = Portfolio.new
    # hard coded style
    # TODO refactor
    3.times { @portfolio_item.technologies.build }
  end

  # POST /portfolios
  def create
    @portfolio_item = Portfolio.new(portfolio_params)
    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio saved successfully' }
      else
        format.html { render :new }
      end
    end
  end

  # GET /portfolios/:id/edit
  def edit; end

  # PUT /portfolios/:id
  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'The record was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /portfolios/:id
  def destroy
    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'The record was removed.' }
    end

  end

  private

  def set_portfolio
    @portfolio_item = Portfolio.find(params[:id])
  end

  def portfolio_params
    params.require(:portfolio).permit(
      :title,
      :subtitle,
      :body,
      technologies_attributes: [:name]
    )
  end
end

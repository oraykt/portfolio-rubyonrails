class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: %i[show edit update destroy toggle_status]
  layout 'portfolio'
  access all: %i[show index],
         user: { except: %i[new create update edit destroy sort] },
         site_admin: :all

  # GET /portfolios
  def index
    @portfolios = Portfolio.by_position
    @page_title = 'Oray Kurt | Portfolios'
  end

  # PUT /portfolios/sort
  def sort
    params[:order].each do |_key, value|
      Portfolio.find(value[:id]).update(position: value[:position])
    end

    # bypass the traditional type of process
    head :ok
  end

  # GET /portfolio/:id
  def show
    @page_title = @portfolio.title
  end

  # GET /portfolios/new
  def new
    @portfolio = Portfolio.new
    # hard coded style
    # TODO refactor
    3.times { @portfolio.technologies.build }
  end

  # POST /portfolios
  def create
    @portfolio = Portfolio.new(portfolio_params)
    respond_to do |format|
      if @portfolio.save
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
      if @portfolio.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'The record was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /portfolios/:id
  def destroy
    @portfolio.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'The record was removed.' }
    end
  end

  private

  def set_portfolio
    @portfolio = Portfolio.find(params[:id])
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

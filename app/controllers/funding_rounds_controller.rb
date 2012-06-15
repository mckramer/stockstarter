class FundingRoundsController < ApplicationController
  
  rescue_from ActiveRecord::RecordNotFound do |exception|
    redirect_to companies_path, :notice => 'No item exists with specified id.'
  end
  
  before_filter :get_company
  
  # GET /companies/1/funding_rounds
  # GET /companies/1/funding_rounds.json
  def index
    @funding_rounds = @company.funding_rounds

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @funding_rounds }
    end
  end

  # GET /companies/1/funding_rounds/1
  # GET /companies/1/funding_rounds/1.json
  def show
    @funding_round = @company.funding_rounds.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @funding_round }
    end
  end

  # GET /companies/1/funding_rounds/new
  # GET /companies/1/funding_rounds/new.json
  def new
    @funding_round = @company.funding_rounds.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @funding_round }
    end
  end

  # GET /companies/1/funding_rounds/1/edit
  def edit
    @funding_round = @company.funding_rounds.find(params[:id])
  end

  # POST /companies/1/funding_rounds
  # POST /companies/1/funding_rounds.json
  def create
    @funding_round = @company.funding_rounds.build(params[:funding_round])

    respond_to do |format|
      if @funding_round.save
        format.html { redirect_to @funding_round, notice: 'Funding round was successfully created.' }
        format.json { render json: @funding_round, status: :created, location: @funding_round }
      else
        format.html { render action: "new" }
        format.json { render json: @funding_round.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /companies/1/funding_rounds/1
  # PUT /companies/1/funding_rounds/1.json
  def update
    @funding_round = @company.funding_rounds.find(params[:id])

    respond_to do |format|
      if @funding_round.update_attributes(params[:funding_round])
        format.html { redirect_to @funding_round, notice: 'Funding round was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @funding_round.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1/funding_rounds/1
  # DELETE /companies/1/funding_rounds/1.json
  def destroy
    @funding_round = @company.funding_rounds.find(params[:id])
    @funding_round.destroy

    respond_to do |format|
      format.html { redirect_to funding_rounds_url }
      format.json { head :ok }
    end
  end
  
  private
  
  def get_company
    @company = Company.find(params[:company_id])
  end
  
end

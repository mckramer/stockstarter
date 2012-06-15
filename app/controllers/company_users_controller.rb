class CompanyUsersController < ApplicationController
  # GET /company_users
  # GET /company_users.json
  def index
    @company_users = CompanyUser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @company_users }
    end
  end

  # GET /company_users/1
  # GET /company_users/1.json
  def show
    @company_user = CompanyUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @company_user }
    end
  end

  # GET /company_users/new
  # GET /company_users/new.json
  def new
    @company_user = CompanyUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @company_user }
    end
  end

  # GET /company_users/1/edit
  def edit
    @company_user = CompanyUser.find(params[:id])
  end

  # POST /company_users
  # POST /company_users.json
  def create
    @company_user = CompanyUser.new(params[:company_user])

    respond_to do |format|
      if @company_user.save
        format.html { redirect_to @company_user, notice: 'Company user was successfully created.' }
        format.json { render json: @company_user, status: :created, location: @company_user }
      else
        format.html { render action: "new" }
        format.json { render json: @company_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /company_users/1
  # PUT /company_users/1.json
  def update
    @company_user = CompanyUser.find(params[:id])

    respond_to do |format|
      if @company_user.update_attributes(params[:company_user])
        format.html { redirect_to @company_user, notice: 'Company user was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @company_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_users/1
  # DELETE /company_users/1.json
  def destroy
    @company_user = CompanyUser.find(params[:id])
    @company_user.destroy

    respond_to do |format|
      format.html { redirect_to company_users_url }
      format.json { head :ok }
    end
  end
end

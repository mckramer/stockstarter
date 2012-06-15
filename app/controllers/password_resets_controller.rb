class PasswordResetsController < ApplicationController
  
  skip_before_filter :require_login

  # Request password reset.
  # You get here when the user entered his email in the reset password form and submitted it.
  # POST /password_resets
  def create 
    @user = User.find_by_email(params[:email])
    
    # This line sends an email to the user with instructions on how to reset their password (a url with a random token)
    @user.deliver_reset_password_instructions! if @user
    
    # Tell the user instructions have been sent whether or not email was found.
    # This is to not leak information to attackers about which emails exist in the system.
    redirect_to(root_path, :notice => 'Instructions have been sent to your email.')
  end

  # Password reset form
  # GET /password_resets/1/edit
  def edit
    @user = User.load_from_reset_password_token(params[:id])
    @token = params[:id]
    not_authenticated if !@user
  end
  
  # Submitted password reset form
  # PUT /password_resets/1/edit"
  def update
    @token = params[:token] # Needed to render the form again in case of error
    @user = User.load_from_reset_password_token(@token)
    not_authenticated if !@user
    
    # Makes the password confirmation validation work
    @user.password_confirmation = params[:user][:password_confirmation]
    
    # Clear the temporary token and update the password
    if @user.change_password!(params[:user][:password])
      redirect_to(root_path, :notice => 'Password was successfully updated.')
    else
      render :action => "edit"
    end
  end

end

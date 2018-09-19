class SessionsController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if @user
      sign_in(@user)
    else
      flash[:errors] = "Invalid login creds"
      render :new
    end
  end

  def destroy
    sign_out
  end

end

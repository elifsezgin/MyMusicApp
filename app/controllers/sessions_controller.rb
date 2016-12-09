class SessionsController < ApplicationController

  def create
    user = User.find_by_credentials(session_params[:email], session_params[:password])
    if user
      log_in_user!(user)
      redirect_to bands_url
    else
      flash.now[:messages] = ['Wrong email or password']
      render :new
    end
  end

  def new
    render :new
  end

  def destroy
    log_out
    redirect_to new_session_url
  end

  private
  def session_params
    params.require(:session).permit(:email, :password)
  end

end

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user&.authenticate params[:session][:password]
      if user.activated?
        when_activated
      else
        message = t("sessions.create.account_not_activated")
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = t("sessions.create.invalid_message")
      render :new
    end
  end

  def when_activated
    log_in user
    params[:session][:remember_me] == "1" ? remember(user) : forget(user)
    redirect_back_or user
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

  def remember_me user
    params[:session][:remember_me] == "1" ? remember(user) : forget(user)
  end
end

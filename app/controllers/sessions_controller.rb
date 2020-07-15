class SessionsController < ApplicationController
  def create
    @user = User.find_or_initialize_by(username: param_username)

    if @user.new_record?
      @user.password = param_password
      @user.save
      flash[:success] = 'Register successfully'
      session[:user_id] = @user.id
    else
      if @user.authenticate(param_password)
        flash[:success] = 'Login successfully'
        session[:user_id] = @user.id
      else
        flash[:error] = 'Login unsuccessfully'
      end
    end

    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'Logout successfully'

    redirect_to root_path
  end

  private

  def param_username
    params.require(:username)
  end

  def param_password
    params.require(:password)
  end
end

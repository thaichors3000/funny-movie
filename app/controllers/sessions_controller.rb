class SessionsController < ApplicationController
  def create
    @user = User.find_or_initialize_by(username: param_username)

    if @user.new_record?
      @user.password = param_password
      @user.save!
    end

    session[:user_id] = @user.id

    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'Logout successfully'

    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def param_username
    params.require(:username)
  end

  def param_password
    params.require(:password)
  end
end

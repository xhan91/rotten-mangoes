class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by email: params[:email]

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to movies_path, notice: "Welcome back, #{user.firstname}!"
    else
      render :new
    end
  end

  def fake
    session[:admin_id] = current_user.id
    session[:user_id] = params[:id]
    redirect_to movies_path, notice: "ADMIN, you are in fake mode now!"
  end

  def fake_quit
    session[:user_id] = session[:admin_id]
    session[:admin_id] = nil
    redirect_to admin_users_path, notice: "Fake mode quited!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to movies_path, notice: "Adios!"
  end
  
end

class UserController < ApplicationController
  def login
  end
  def login_process
    u=User.find_by_username(params[:username])
    if u.nil?
      render :text =>"No such a user"
    elsif u.passwd == params[:passwd]
      session[:user]=u
      redirect_to :controller =>"letter", :action => 'main'
    else
      render :text =>"Password is not correct."
    end
  end
end

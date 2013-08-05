require 'base64'
require 'digest/md5'

class SessionsController < ApplicationController
  def index
    render 'new'
  end

  def create
    if params[:name] == "admin" && is_correct?(params[:pass]) then
      session[:user_id] = "admin"
      redirect_to posts_path
    else
      render 'login_failure'
    end
  end

  def destroy
    session[:user_id] = nil
    render "new"
  end

  def is_correct? pass
    Base64.encode64(Digest::MD5.digest(pass)) == "V8D1G4qOxCsUtcqMaBaPpA==\n"
  end
end

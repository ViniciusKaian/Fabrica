class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :check_session, except: [:login,:logar, :new, :show, :create]

  def check_session
  	if session[:usuario]
  		@usuario_logado = User.find(session[:usuario])
  	else
  		redirect_to login_path
  	end
  end
end

class UsersController < ApplicationController
	
	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])

		if @user.save
			redirect_to @user, notice: "Nao foi possivel cadastrar."
		else
			render :action => "new"
		end
	end

	# def show
	# end

	def self.autenticacao(email, senha)
		user = find_by_email(email)
	end
end

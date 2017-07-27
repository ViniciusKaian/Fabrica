class UsersController < ApplicationController
	
	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])

		if @user.save
			flash[:notice] = "Salvo com sucesso."
			redirect_to @user#, notice: "Salvo com sucesso."
		else
			flash[:notice] = "Erro ao salvar"
			render :action => "new"#, notice: "Nao salvou"
		end
	end

	def show
		@user = User.find(params[:id])
		
		respond_to do |format|
			format.html
		end
	end

	def login
		reset_session
	end

	def logar
		# Codigo para parar no console e testar parametros codigos etc
		# binding.pry
		email = params[:email]
		senha = params[:senha]

		@user = User.logar_user(email, senha)

		if @user
			session[:usuario] = @user.id

			flash[:notice] = "Sucesso ao logar"
			# render :action => "show"
			redirect_to @user
		else
			flash[:notice] = "Erro ao logar."
			render :action => "login"
		end
	end

	def login_off
		reset_session
		redirect_to login_path
	end
end

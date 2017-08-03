class UsersController < ApplicationController
	
	def index
		@user = User.all

		respond_to do |format|
			format.html
		end
	end

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
			redirect_to cadastro_path
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

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		senha = params[:user][:senha]

		if @user.update_attributes(senha: senha)
			redirect_to login_path
		else
			render 'edit'
		end
	end

	def redefine_senha
		@user = User.find_by_email(params[:email])
		UserMailer.redefinir_senha(@user).deliver
		redirect_to login_path
	end

	def redefine
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy

		respond_to do |format|
			format.html { redirect_to mostrartodos_url }
		end
	end

	
end

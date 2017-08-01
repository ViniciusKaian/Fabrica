class RacaosController < ApplicationController
  def index
		@racao = Racao.all

		respond_to do |format|
			format.html
		end
	end

	def new
		@racao = Racao.new
	end

  	def create
  		@racao = Racao.new(params[:racao])

  		if @racao.save
			flash[:notice] = "Salvo com sucesso."
			redirect_to @racao
		else
			flash[:notice] = "Erro ao salvar"
			render :action => "new"
		end
  	end

  	def show
  		@racao = Racao.find(params[:id])

  		respond_to do |format|
  			format.html
  		end
  	end

  	def edit
  		@racao = Racao.find(params[:id])
  	end

  	def update
  		@racao = Racao.find(params[:id])
  		ativa = params[:ativa]

		if @racao.update_attributes(ativa: ativa)
			# redirect_to login_path
		else
			render 'edit'
		end

  	end


	def destroy
		@racao = Racao.find(params[:id])
		@racao.destroy

		respond_to do |format|
			format.html { redirect_to racaos_url }
		end
	end

	# def status
	# 	if @racao.ativa == true
	#  		status = "Ativa"
	# 	else	
	# 		status = "Não Ativa"
	# 	end
	# 	status
	# end
end

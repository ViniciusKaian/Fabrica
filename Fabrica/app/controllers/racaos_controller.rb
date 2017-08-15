class RacaosController < ApplicationController
  
  def index
  		if params[:attr]
			if params[:attr] == 'cod'
				@racao = Racao.order("#{params[:attr]} #{params[:direcao]}").paginate(:page => params[:page], :per_page => 10)
			else
				@racao = Racao.order("#{params[:attr]} #{params[:direcao]}").paginate(:page => params[:page], :per_page => 10)
			end
			params[:direcao] = params[:direcao] == 'DESC' ? 'ASC' : 'DESC'
		else
			@racao = Racao.order('cod DESC').paginate(:page => params[:page], :per_page => 10)
		end

		# @racao = Racao.all

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
			flash[:notice] = @racao.errors.full_messages
			redirect_to @racao
		else
			flash[:notice] = @racao.errors.full_messages
			render 'new'
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
  		cod = params[:racao][:cod]
  		description = params[:racao][:description]
  		ativa = params[:racao][:ativa]

		if @racao.update_attributes(cod: cod, description: description,ativa: ativa)
			redirect_to racao_path
		else
			flash[:notice] = @racao.errors.full_messages
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


end

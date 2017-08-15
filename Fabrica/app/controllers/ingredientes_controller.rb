class IngredientesController < ApplicationController
	def index
		if params[:attr]
			if params[:attr] == 'codigo'
				@ingrediente = Ingrediente.order("#{params[:attr]} #{params[:direcao]}").paginate(:page => params[:page], :per_page => 10)
			else
				@ingrediente = Ingrediente.order("#{params[:attr]} #{params[:direcao]}").paginate(:page => params[:page], :per_page => 10)
			end
			params[:direcao] = params[:direcao] == 'DESC' ? 'ASC' : 'DESC'
		else
			@ingrediente = Ingrediente.order('codigo DESC').paginate(:page => params[:page], :per_page => 10)
		end


		# @ingrediente = Ingrediente.all

		respond_to do |format|
			format.html
		end
	end

	def new
		@ingrediente = Ingrediente.new
	end

	def create
		@ingrediente = Ingrediente.new(params[:ingrediente])

		if @ingrediente.save
			flash[:notice] = @ingrediente.errors.full_messages
			redirect_to @ingrediente
		else
			flash[:notice] = @ingrediente.errors.full_messages
			render 'new'
		end
	end

	def show
		@ingrediente = Ingrediente.find(params[:id])

		respond_to do |format|
			format.html
		end
	end

	def edit
		@ingrediente = Ingrediente.find(params[:id])
	end

	def update
		@ingrediente = Ingrediente.find(params[:id])
		codigo = params[:ingrediente][:codigo]
		description = params[:ingrediente][:description]
		ativo = params[:ingrediente][:ativo]

		if @ingrediente.update_attributes(codigo: codigo, description: description, ativo: ativo)
			redirect_to ingredientes_path
		else
			flash[:notice] = @ingrediente.errors.full_messages
			render 'edit'
		end
	end

	def destroy
		@ingrediente = Ingrediente.find(params[:id])
		@ingrediente.destroy

		respond_to do |format|
			format.html { redirect_to ingredientes_path }
		end
	end
end

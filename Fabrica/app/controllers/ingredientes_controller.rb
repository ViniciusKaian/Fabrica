class IngredientesController < ApplicationController
	def index
		@ingrediente = Ingrediente.all

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
			flash[:notice] = "Salvo com sucesso!"
			redirect_to @ingrediente
		else
			flash[:notice] = "Erro ao salvar!"
			redirect_to novoingrediente_path
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
		status = params[:ingrediente][:ativo]

		if @ingrediente.update_attributes(codigo: codigo, description: description, ativo: status)
			redirect_to ingredientes_path
		else
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

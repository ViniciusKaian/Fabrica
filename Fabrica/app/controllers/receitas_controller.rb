class ReceitasController < ApplicationController
	
	def index
		@receita = Receita.all

		@codigo_racoes_receita = []

		@racoes = Racao.all

		@racoes.each do |racao|
			@codigo_racoes_receita << racao.cod
		end

		respond_to do |format|
			format.html
		end
	end

	def new
		@receita = Receita.new
	end

	def create

		if Racao.find_by_id(params[:receita][:racao_id])
			@receita = Receita.new(params[:receita])

			if @receita.save
				flash[:notice] = @receita.errors.full_messages
				redirect_to @receita
			else
				flash[:notice] = @receita.errors.full_messages
				render 'new'
			end
		else
			# redirect_to new_receita_path
			flash[:notice] = "Racao nao existe"
			render 'new'
		end
	end

	def adiciona_ingrediente_receita
		
		if Ingrediente.find_by_id(params[:ingrediente][:id])
			@ingrediente = Ingrediente.new(params[:ingrediente][:id])

			if @ingrediente.save
				flash[:notice] = @ingrediente.errors.full_messages
				redirect_to @receita
			else
				flash[:notice] = @receita.errors.full_messages
				render 'show'
			end
		else

		end

	end

	def show
		@receita = Receita.find(params[:id])
		id_racao = @receita.racao_id

		@racao = Racao.find(id_racao)

		id_receita = @receita.id

		@ingredientes_receita = []
		@percentuais = []

		if ImgRec.find_by_Rec_id(id_receita)
			@imgrec = ImgRec.all

			@imgrec.each do |imgrec|
				if imgrec.Rec_id == id_receita
					@ingredientes_receita << Ingrediente.find_by_id(imgrec.img_id)
					@percentuais << imgrec.percentual
				end
			end
		end

		respond_to do |format|
			format.html
		end
	end

	def edit
		@receita = Receita.find(params[:id])
	end

	def update
		@receita = Receita.find(params[:id])
		racao_id = params[:receita][:racao_id]

		if @ingrediente.update_attributes(racao_id: racao_id)
			redirect_to receitas_path
		else
			flash[:notice] = @receitas.errors.full_messages
			render 'edit'
		end
	end

	def destroy
		@receita = Receita.find(params[:id])
		@receita.destroy

		respond_to do |format|
			format.html { redirect_to receitas_path }
		end
	end
end

class ReceitasController < ApplicationController
	
	def index

		# Se o parametro :filtra_id não vier vaziu então busca receita pelo id
		if !params[:filtra_id].blank?
			@receita = Receita.filtra_id(params[:filtra_id])

		# Se o parametro filta_codigo_racao não vier vaziu então filtra por receita
		elsif !params[:filtra_codigo_racao].blank?
			@receita = Receita.filtra_codigo_racao(params[:filtra_codigo_racao])
		else
			# se não pega todas as receitas
			@receita = Receita.all
		end
		
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
		@receita.img_rec.build
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

	def add_ingrediente
		@imgrec = ImgRec.new
		@receitas = Receita.all
		@ingredientes = Ingrediente.all
	end

	def salva_ingrediente
		if Ingrediente.find_by_id(params[:img_rec][:img_id])
			
			@imgrec = ImgRec.new(params[:img_rec])

			if @imgrec.save
				flash[:notice] = @imgrec.errors.full_messages
				redirect_to receita_path(id: @imgrec.Rec_id)
			else
				flash[:notice] = @imgrec.errors.full_messages
				render 'new'
			end
		else
			# redirect_to new_receita_path
			flash[:notice] = "Ingrediente nao existe"
			render 'new'
		end
	end

	def remove_ingrediente
		@ingrec = ImgRec.find(params[:id])

		id_receita = @ingrec.Rec_id
		
		@ingrec.destroy

		respond_to do |format|
			format.html {redirect_to receita_path(id: id_receita)}
		end
	end
end

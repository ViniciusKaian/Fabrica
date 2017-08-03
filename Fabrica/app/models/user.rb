class User < ActiveRecord::Base
	attr_accessible :email, :name, :senha, :senha_confirmation

	validates_presence_of :name, :email, :senha

	# validates_uniqueness_of -> verifica se o nome ou email são unicos no banco
	validates_uniqueness_of :name
	validates_uniqueness_of :email

	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

	validates_length_of :senha, minimum: 6
	validates_confirmation_of :senha
  
	def self.logar_user(email, senha)
		user = User.find_by_email_and_senha(email, senha)

		if user
			return user
		else
			return false
		end
	end
end

class Racao < ActiveRecord::Base
  attr_accessible :ativa, :cod, :description
 	
  	validates_presence_of :cod, :description

 	validates_uniqueness_of :cod #verifica codigo unico no banco
 	validates_length_of :cod, minimum: 8, maximum: 8
 	
 	# uma ração pode ter varias receitas
 	has_many :receitas, dependent: :destroy
end

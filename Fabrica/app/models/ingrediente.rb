class Ingrediente < ActiveRecord::Base
  attr_accessible :ativo, :codigo, :description

  validates_presence_of :codigo, :description,:ativo

  validates_uniqueness_of :codigo

  validates_length_of :codigo, minimum: 8, maximum: 8

  validates_length_of :description, minimum: 6
  
end

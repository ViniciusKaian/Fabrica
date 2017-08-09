class Ingrediente < ActiveRecord::Base
  attr_accessible :ativo, :codigo, :description

  validates_presence_of :codigo, :description

  validates_uniqueness_of :codigo

  validates_length_of :codigo, minimum: 8

  validates_length_of :description, minimum: 6
  
  # img_rec --> Imgrediente receita

  # para cada ingrediente tenho varias img_rec
  # para cada ingrediente, tem várias configurações de ingrediente(img_rec)
  has_many :img_rec

end

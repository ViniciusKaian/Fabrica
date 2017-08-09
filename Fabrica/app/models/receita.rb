class Receita < ActiveRecord::Base
  attr_accessible :racao_id

  validates_presence_of :racao_id

  # Cada ração vai te uma única receita
  belongs_to :racao

  # uma receita pode ter varios ingredientes
  has_many :img_rec, foreign_key: :Rec_id, dependent: :destroy

end

class ImgRec < ActiveRecord::Base
  attr_accessible :Rec_id, :img_id, :percentual

  validates_presence_of :Rec_id, :img_id, :percentual

  # para cada ingrediente tenho uma receita
  belongs_to :receita

  # para cada configuração de ingrediente, tenho um ingrediente
  belongs_to :ingrediente

end
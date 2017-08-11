class Receita < ActiveRecord::Base
  attr_accessible :racao_id, :img_rec_attributes

  validates_presence_of :racao_id

  # Cada ração vai te uma única receita
  belongs_to :racao

  # uma receita pode ter varios ingredientes
  has_many :img_rec, foreign_key: :Rec_id, dependent: :destroy

  accepts_nested_attributes_for :img_rec

  #scope :Nome_filtro, ->(parametro) {where("Nome_campo_tabela = ?", parametro)}
  scope :filtra_id, ->(id) { where("id = ?", id) }

  #scope :nome_filtro, ->(parametro) {joins(:nome_relacionamento).where("nome_tabela.nome_campo_tabela", parametro)}
  scope :filtra_codigo_racao, ->(codigo_racao) { joins(:racao).where("racaos.cod = ?", codigo_racao) }
end

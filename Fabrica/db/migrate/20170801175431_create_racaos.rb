class CreateRacaos < ActiveRecord::Migration
  def change
    create_table :racaos do |t|
      t.integer :cod
      t.text :description
      t.boolean :ativa

      t.timestamps
    end
  end
end

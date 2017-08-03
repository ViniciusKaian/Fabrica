class CreateIngredientes < ActiveRecord::Migration
  def change
    create_table :ingredientes do |t|
      t.integer :codigo
      t.string :description
      t.boolean :ativo

      t.timestamps
    end
  end
end

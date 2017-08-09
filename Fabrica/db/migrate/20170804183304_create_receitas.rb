class CreateReceitas < ActiveRecord::Migration
  def change
    create_table :receitas do |t|
      t.integer :racao_id

      t.timestamps
    end
  end
end

class CreateImgRecs < ActiveRecord::Migration
  def change
    create_table :img_recs do |t|
      t.integer :Rec_id
      t.integer :img_id
      t.float :percentual

      t.timestamps
    end
  end
end

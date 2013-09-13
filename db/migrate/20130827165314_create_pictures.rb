class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :picname
      t.references :product, index: true

      t.timestamps
    end
  end
end

class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.decimal :price
      t.text :description
      t.references :category, index: true

      t.timestamps
    end
  end
end

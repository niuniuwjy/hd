class AddNameToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :Name, :string
  end
end

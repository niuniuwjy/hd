class AddPictureToProduct < ActiveRecord::Migration
  def change
    add_reference :products, :picture, index: true
  end
end

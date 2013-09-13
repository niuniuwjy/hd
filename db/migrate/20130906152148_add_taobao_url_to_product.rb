class AddTaobaoUrlToProduct < ActiveRecord::Migration
  def change
    add_column :products, :taobao_url, :string
  end
end

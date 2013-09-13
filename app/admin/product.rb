ActiveAdmin.register Product do
  config.per_page = 10
  config.sort_order = 'id_des'

  # Create sections on the index screen
  scope :all, :default => true
  # Filterable attributes on the index screen
  filter :title
  filter :price
  filter :pictures
  filter :categroy_id
  filter :created_at
  filter :updated_at

  index do
    column :id
    column :title
    column :category_id
    column :taobao_url
    column "Created At", :created_at
    column "Updated At", :updated_at
    column "Price" do |product|
      number_to_currency product.price
    end

    default_actions
  end


  show :title =>:title do |product|
    panel "Products" do
      attributes_table_for product do
      row ("id")
      row ("title")
      row ("category_id")
      row ("taobao_url")
      row ("price")  {|product| link_to product.price,  admin_product_path(product)}
      row ("description"), as: :html_editor
      end
      end
    panel "Pictures" do
      table_for product.pictures do |picture|
        picture.column ("Picture Name")  {|picture| link_to picture.picname,  admin_picture_path(picture) }
      end
    end
  end




  form do |f|
    f.inputs "Details of Product" do
      f.input :title, as: :html_editor
      f.input :price
      f.input :taobao_url
      f.input :description, as: :html_editor
      f.input :category_id
    end
    f.has_many :pictures do |picture|
    picture.inputs "Pictures" do
      picture.input :picname
      picture.input :image
    end
   end

    f.actions
  end

  ActiveAdmin.setup do |config|
    # Want PDF added to default download links
    config.download_links = [:csv, :xml, :json, :pdf]
  end
  action_item do
    link_to "Pictrues" , "/admin/pictures"
  end

end

ActiveAdmin.register Picture do
  config.per_page = 10
  config.sort_order = 'product_id_des'

  scope :all, :default => true
  actions :all
  filter :id
  filter :product_id


  index do
    column :id
    column :picname
    column :product_id

    column "Created At", :created_at
    column "Updated At", :updated_at

    column "Image",:image

    default_actions


  end

  index :as => :grid, :default => false do |picture|
    link_to(image_tag(picture.image), admin_picture_path(picture))
  end
end

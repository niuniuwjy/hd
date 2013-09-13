class Picture < ActiveRecord::Base
  belongs_to :product

  mount_uploader :image, ImageUploader

  attr_accessible :product_id, :picname, :image,:remote_image_url

end

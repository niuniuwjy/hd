class Product < ActiveRecord::Base
  include Likeable

  belongs_to :category
  has_many :comments
  has_many :pictures

  acts_as_commentable


  default_scope :order => 'id DESC'

  accepts_nested_attributes_for :pictures

  attr_accessible :title ,:price,:description,:category_id, :comments,:taobao_url




end


class Comment < ActiveRecord::Base

  belongs_to :commentable, :polymorphic => true
  belongs_to :user

  default_scope :order => 'created_at ASC'
  attr_accessible :title, :comment

  validates :comment, :presence => true
  validates :user, :presence => true
end

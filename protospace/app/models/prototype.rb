class Prototype < ActiveRecord::Base
  has_many :images, dependent: :delete_all
  belongs_to :user
  accepts_nested_attributes_for :images
end

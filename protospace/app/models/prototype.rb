class Prototype < ActiveRecord::Base
  has_many :images, dependent: :delete_all
  has_many :comments
  belongs_to :user
  has_many :likes

  acts_as_taggable

  accepts_nested_attributes_for :images, reject_if: :reject_images
  validates_presence_of :title, :catchcopy, :concept


  def reject_images(attributed)
    attributed['image'].blank?
  end
end

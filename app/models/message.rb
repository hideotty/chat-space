class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group
  mount_uploader :img, ImageUploader
  validates :content_or_img, presence: true

  private
  def content_or_img
    content.presence||img.presence
  end
end

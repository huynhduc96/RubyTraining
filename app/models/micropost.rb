class Micropost < ApplicationRecord
  belongs_to :user
  scope :order_desc, ->{order created_at: :desc}

  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: Settings.max_content}
  validate :picture_size

  def picture_size
    return if picture.size <= Settings.size_pic.megabytes
    errors.add :picture, t("micropost.pic_size")
  end
end

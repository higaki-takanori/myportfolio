class Play < ApplicationRecord
  mount_uploader :play_image_path, PlayImageUploader
  has_many :likes
  belongs_to :user

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  private

    # アップロードされた画像のサイズをバリデーションする
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end

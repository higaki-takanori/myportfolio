class User < ApplicationRecord
  mount_uploader :user_image_path, UserImageUploader
  has_many :likes
  has_many :plays
  attr_accessor :remember_token

  validates :name, 
        presence: true, 
        length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, 
      presence: true, 
      length: { maximum: 255 }, 
      format: { with: VALID_EMAIL_REGEX },
      uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }, allow_nil: true

  # 渡された文字列のハッシュ値を返す
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # ランダムなトークンを返す
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update(remember_digest: User.digest(remember_token))
  end

  # 渡されたトークンがダイジェストと一致したらtrueを返す
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  # ユーザーのログイン情報を破棄する
  def forget
    update(remember_digest: nil)
  end

  def image_url
    if user_image_path.nil?
      return default_url
    end
    user_image_path.url
  end

  private

    # アップロードされた画像のサイズをバリデーションする
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end

end

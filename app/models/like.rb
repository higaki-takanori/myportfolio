class Like < ApplicationRecord
  belongs_to :user
  belongs_to :play

  # 同じ投稿を複数回お気に入り登録させないため
  validates_uniqueness_of :play_id, scope: :user_id

end

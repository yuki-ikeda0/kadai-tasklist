class Taskapp < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true # ユーザの紐付け無しには Micropost を保存不可
  validates :content, presence: true, length: { maximum: 255 }
end

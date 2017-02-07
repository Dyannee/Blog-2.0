class Comment < ApplicationRecord
  belongs_to :album
  belongs_to :user
  validates :comment, presence: true, length: { maximum: 252}
end

class Micropost < ActiveRecord::Base
  validates :content, length: {maximum: 25}
  belongs_to :user
end

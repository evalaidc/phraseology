class Language < ApplicationRecord
  has_many :gatherings, dependent: :destroy
  has_many :lessons, dependent: :destroy
  belongs_to :user
end

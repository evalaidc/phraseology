class Language < ApplicationRecord
  has_many :gatherings, dependent: :destroy
  belongs_to :user
end

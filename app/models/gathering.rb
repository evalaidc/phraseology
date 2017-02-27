class Gathering < ApplicationRecord
  belongs_to :language
  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :user
end

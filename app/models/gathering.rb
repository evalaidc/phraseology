class Gathering < ApplicationRecord
  belongs_to :language
  has_many :attendances
  has_many :users, through: :attendances
  has_many :comments
  belongs_to :user
end

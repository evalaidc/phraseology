class Gathering < ApplicationRecord
  belongs_to :language
  has_many :attendances
  has_many :users, through: :attendances, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user



end

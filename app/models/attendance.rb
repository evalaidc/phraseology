class Attendance < ApplicationRecord
  belongs_to :gathering
  belongs_to :user
end

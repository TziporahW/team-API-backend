class Capstone < ApplicationRecord
  belongs_to :student
  validates :student_id, presence: true
end

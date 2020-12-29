class Skill < ApplicationRecord
  belongs_to :student
  validates :skill_name, presence: true
  validates :student_id, presence: true
end

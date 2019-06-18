class Discipline < ApplicationRecord
  self.primary_key = 'discipline'
  has_and_belongs_to_many :specialty
  has_many :teaching_materials
  validates :discipline, :course, :specialty_id, presence: true
  validates :discipline, uniqueness: true
end

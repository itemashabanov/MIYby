class Discipline < ApplicationRecord
  self.primary_key = 'discipline'
  belongs_to :group
  has_many :teaching_materials
  validates :discipline, :teacher, :semester, :group_id, presence: true
end

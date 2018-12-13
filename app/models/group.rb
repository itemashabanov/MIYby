class Group < ApplicationRecord
  self.primary_key = 'group'
  has_many :disciplines
  has_many :teaching_materials
  validates :group, :specialty, :specialization, presence: true
  validates :group, uniqueness: true
end

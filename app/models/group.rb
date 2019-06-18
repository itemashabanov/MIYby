class Group < ApplicationRecord
  self.primary_key = 'group'
  belongs_to :specialty
  validates :group, :specialty_id, presence: true
  validates :group, uniqueness: true
end

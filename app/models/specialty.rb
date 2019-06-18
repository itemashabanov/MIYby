class Specialty < ApplicationRecord
  self.primary_key = 'specialty'
  has_and_belongs_to_many :disciplines
  has_many :groups
  validates :specialty, presence: true, uniqueness: true
end

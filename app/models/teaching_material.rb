class TeachingMaterial < ApplicationRecord
  belongs_to :discipline
  belongs_to :group
  validates :url, :name, :discipline_id, :group_id, presence: true
end

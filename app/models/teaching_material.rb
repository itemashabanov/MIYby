class TeachingMaterial < ApplicationRecord
  belongs_to :discipline
  validates :url, :name, :discipline_id, presence: true
end

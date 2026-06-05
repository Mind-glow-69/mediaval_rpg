class Step < ApplicationRecord
  belongs_to :quest
  has_many :riddles, dependent: :destroy

  validates :quest, presence: true
  validates :position, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
  validates :step_type, presence: true
end

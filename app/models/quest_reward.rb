class QuestReward < ApplicationRecord
  belongs_to :quest
  belongs_to :item
  validates :quest, :item, presence: true
end

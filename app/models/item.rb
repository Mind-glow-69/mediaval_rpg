class Item < ApplicationRecord
	has_many :quest_rewards, dependent: :nullify
	has_many :quests, through: :quest_rewards

	validates :name, presence: true
	validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
end

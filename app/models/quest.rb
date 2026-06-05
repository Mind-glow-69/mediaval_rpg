class Quest < ApplicationRecord
	has_many :steps, dependent: :destroy
	has_many :quest_rewards, dependent: :destroy
	has_many :items, through: :quest_rewards

	validates :title, presence: true
	validates :reward_xp, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
end

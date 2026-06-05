class Riddle < ApplicationRecord
  belongs_to :step

  serialize :answers, JSON

  validates :step, presence: true
  validates :question, presence: true
  validates :correct_answer, presence: true
end

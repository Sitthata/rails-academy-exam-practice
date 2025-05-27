class QuestItem < ApplicationRecord
  validates :name, presence: { message: "กรุณากรอก quest ก่อน" }
end

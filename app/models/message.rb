class Message < ApplicationRecord
  belongs_to :patient, dependent: :destroy
  default_scope -> { order(created_at: :desc)  }
  validates :patient_id, presence: true
  validates :content, presence: true, length: { maximum: 140  }
end

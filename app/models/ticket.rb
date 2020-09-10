class Ticket < ApplicationRecord
  belongs_to :company
  belongs_to :user

  scope :by_user, -> (user_id) { where(user_id: user_id) }
  scope :by_last_tickets, -> (user_id) { where('created_at >= ?', Time.zone.now.beginning_of_day) }
end

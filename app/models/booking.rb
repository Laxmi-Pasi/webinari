require "rqrcode"
class Booking < ApplicationRecord
  belongs_to :customer
  belongs_to :workshop
  after_create_commit :update_workshop_sit_count

  def update_workshop_sit_count
    workshop.update(remaining_seats: workshop.remaining_seats - no_of_tickets)
  end
end

class Booking < ApplicationRecord
  belongs_to :customer
  belongs_to :workshop
  after_create :update_workshop_sit_count

  def update_workshop_sit_count
    
    binding.pry
    
    workshop.update(remaining_seats: workshop.total_seats - no_of_tickets)
  end
end

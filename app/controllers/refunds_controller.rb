class RefundsController < ApplicationController
  def new
    @refund = Refund.new
  end

  def create
    booking = Booking.find_by(order_number: params[:refund][:order_number])
    if booking.present?
      if booking.is_refundable?
        @refund = Refund.create(
          customer_id: booking.customer_id,
          booking_id: booking.id,
          state: 'accepted'
        )
        redirect_to edit_refund_path(@refund), notice: 'your booking request valid. Please fill other details to process your refund request.'
      else
        redirect_to new_refund_path, alert: "You are requesting refund for past workshop.Refund are allowed only for future workshop "
      end
    else
      redirect_to new_refund_path, alert: "You provided an invalid booking ID#{params[:refund][:order_number]}. Please provide valid booking ID"
    end
  end

  def edit
    @refund = Refund.find(params[:id])
  end

  def update
    
    binding.pry
    
  end
end
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
        # redirect_to edit_refund_path(@refund), notice: 'your booking request valid. Please fill other details to process your refund request.'
        redirect_to refund_path(@refund)
      elsif booking.is_ongoing?
        redirect_to new_refund_path, alert: "You are requesting refund for ongoing workshop.Refund are allowed only for future workshop "
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
  end

  def show
    @refund = Refund.find(params[:id])
  end
  
  def refund_details
    @refund = Refund.find(params[:id])
    @booking = Booking.find(@refund.booking_id)
    stripe_charge_id = @booking.stripe_transaction_id
    @stripe_service = StripeService.new
    @stripe_refund = @stripe_service.create_stripe_refund(stripe_charge_id)
    if @stripe_refund
      @refund.update(stripe_refund_id: @stripe_refund.id, is_partial_refund: false, no_of_tickets: @booking.no_of_tickets, 
        amount_refunded: @stripe_refund.amount)
      redirect_to refund_details_refund_path(@refund), notice:"Your Refund is sucessfully send. Your refund details are shown below."
    else
      redirect_to refund_path(@refund), notice: " Something went wrong. Please, try again!"
    end
  end
end
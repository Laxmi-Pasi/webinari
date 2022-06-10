require 'stripe'
class StripeService
  def initialize()
    Stripe.api_key = Rails.application.credentials.dig(:stripe, :secret_key)
  end

  #to generate stripe id for particular customer
  def find_or_create_customer(customer)
    if customer.stripe_customer_id.present?
      stripe_customer = Stripe::Customer.retrieve(customer.stripe_customer_id)
    else
      stripe_customer = Stripe::Customer.create({
        name: customer.full_name,
        email: customer.email,
        phone: customer.contact_number
      })
      customer.update(stripe_customer_id: stripe_customer.id)
    end
    stripe_customer
  end

  #to generate card token

  def create_card_token(params)
    Stripe::Token.create({
      card: {
        number: params[:card_number].to_s,
        exp_month: params[:month],
        exp_year: params[:year],
        cvc: params[:cvv],
      },
    })
  end

  #to generate token and create card for customer
  def create_stripe_customer_card(params, stripe_customer)
    token = create_card_token(params)
    Stripe::Customer.create_source(
      stripe_customer.id,
      {source: token.id }
    )
  end

  #create stripe charge
  def create_stripe_charge(amount_to_be_paid, stripe_customer_id, card_id, workshop)
    Stripe::Charge.create({
      amount: amount_to_be_paid,
      currency: 'usd', 
      customer: stripe_customer_id,
      description: "Amount $#{amount_to_be_paid} charged for #{workshop.name}",
    })
  end

  #create refund 
  def create_stripe_refund(stripe_charge_id)
    Stripe::Refund.create({ charge: stripe_charge_id})
  end
end

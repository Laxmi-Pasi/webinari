class StripeService
    def initialize()
      Stripe.api_key = Rails.application.credentials.dig(:stripe, :secret_key)
      # Stripe.api_key = Rails.application.credentials.dig(:stripe, :publishable_key)
    end
end
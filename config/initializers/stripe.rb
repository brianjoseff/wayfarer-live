# Rails.configuration.stripe = {
#   publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
#   secret_key:      ENV['STRIPE_SECRET_KEY'],
# }
# Stripe.api_key = Rails.configuration.stripe[:secret_key]


if Rails.env.production?
  Stripe.api_key = ENV['STRIPE_SECRET_KEY']
  STRIPE_PUBLIC_KEY = ENV['STRIPE_PUBLISHABLE_KEY']
else
  Stripe.api_key = ENV['STRIPE_TEST_SECRET']
  STRIPE_PUBLIC_KEY = "pk_test_0exo7D0t9qFkV6SqObWEADXP" 
end
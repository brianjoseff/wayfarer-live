# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/




# jQuery ->
#   Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
#   user.setupForm()
#  
# user =
#   setupForm: ->
#     $('#new_user').submit ->
#       $('input[type=submit]').attr('disabled', true)
#       if $('#card_number').length
#         user.processCard()
#         false
#       else
#         true
#  
#   processCard: ->
#     card =
#       number: $('#card_number').val()
#       cvc: $('#card_code').val()
#       expMonth: $('#card_month').val()
#       expYear: $('#card_year').val()
#     Stripe.createToken(card, user.handleStripeResponse)
#  
#   handleStripeResponse: (status, response) ->
#     if status == 200
#       $('#user_stripe_card_token').val(response.id)
#       $('#new_user')[0].submit()
#     else
#       $('#stripe_error').text(response.error.message) + "fuck"
#       $('#stripe_error').show()
#       $('input[type=submit]').attr('disabled', false)


# $ ->
# 	$("#payment_form").submit (event) ->
# 		form = $(this)
# 	  form.find("input[type='submit']").prop "disabled", true
# 		Stripe.createToken form, stripeResponseHandler
# 	  return false
# 
# 
# stripeResponseHandler = (status, response) ->
#   form = $("#payment_form")
# 		alert "nothing"
#   if response.error
# 				alert "error"
#     form.find(".payment-errors").text response.error.message
#     form.find("button").prop "disabled", false
#   else
# 				alert "chyeah"
#     token = response.id
#     form.append $("<input type=\"hidden\" name=\"stripeToken\">").val(token)
#     form.get(0).submit()
#   return
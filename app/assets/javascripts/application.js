// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


jQuery(function() {
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'));
});

var stripeResponseHandler;

$(function() {
  return $("#payment_form").submit(function(event) {
    var form;
    form = $(this);
    form.find("input[type='submit']").prop("disabled", true);
    Stripe.createToken(form, stripeResponseHandler);
    return false;

  });
});

stripeResponseHandler = function(status, response) {
  var form, token;
  form = $("#payment_form");
  
  if (response.error) {
    form.find(".stripe-error").text("")
    form.find(".payment-errors").text(response.error.message);
    form.find("input[type='submit']").prop("disabled", false);
  } else {
    token = response.id;
    form.append($("<input type=\"hidden\" name=\"stripeToken\">").val(token));
    form.get(0).submit();
  }
};

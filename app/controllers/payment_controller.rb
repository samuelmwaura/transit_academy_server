class PaymentController < Sinatra::Base
    set(:default_content_type,"application/json")

   get "/payments" do
    payments = Payment.all
    payments.to_json
   end

end
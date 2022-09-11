class PaymentController < Sinatra::Base
    set(:default_content_type,"application/json")

   get "/payments" do
    payments = Payment.all
    payments.to_json
   end

   post "/payments" do
    new_payment=Payment.create(student_name:params[:student_name],amount:params[:amount],student_id:params[:student_id])
    new_payment.to_json
   end

end
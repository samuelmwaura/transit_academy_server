class ApplicationController < Sinatra::Base
    set(:default_content_type,"application/json")

    post '/login' do
       puts params
       puts User.find_by(username:params[:username],password:params[:password])
    end
end
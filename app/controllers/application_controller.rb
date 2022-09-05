class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json' #content_type
  
  # Add your routes here
  get "/user" do
    {message:"This is for real"}.to_json
  end
   

end

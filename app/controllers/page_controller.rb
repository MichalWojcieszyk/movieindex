class PageController < ApplicationController

  def contact_us
    @submitted = params["commit"]
    @form_error = false
    @name = params["name"]

    if @name == ""
      flash.now['error'] = "Must enter your name!"
      @form_error = true
    end
    
    @email = params["email"]
    @question = params["question"]
    @newsletter = params["newsletter"] == 'newsletter'
    gender = params["gender"]
    @male = gender == "male"
    @female = gender == "female" 
    @product = params["product"]
  end
end

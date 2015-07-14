class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def new
  	@contact = Contact.new
  end

  
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to root_path, notice: 'Your question was successfully sent.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end


  private
  def contact_params
    params.require(:contact).permit(:name, :email, :question, :newsletter)
  end
end

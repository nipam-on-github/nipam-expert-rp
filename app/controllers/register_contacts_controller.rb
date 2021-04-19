class RegisterContactsController < ApplicationController
  def new
    # An instance of RegisterContact is created just the
    # same as you would for any Active Record object.
    @register_contact = RegisterContact.new
  end

  def create
    # Again, an instance of RegisterContact is created
    # just the same as you would for any Active
    # Record object.
    @register_contact = RegisterContact.new(register_contact_params)

    # The valid? method is also called just the same
    # as for any Active Record object.
    if @register_contact.valid?

      # Instead of persisting the values to the
      # database, we're temporarily storing the
      # values in the session.
      session[:register_contact] = {
        'number' => @register_contact.number
      }

      redirect_to new_register_temp_path
    else
      render :new
    end
  end

  private

  # The strong params work exactly as they would
  # for an Active Record object.
  def register_contact_params
    params.require(:register_contact).permit(
      :number
    )
  end
end

class RegisterPurposesController < ApplicationController
  before_action :set_purpose_list

  def new
    # An instance of RegisterPurpose is created just the
    # same as you would for any Active Record object.
    @register_purpose = RegisterPurpose.new
  end

  def create
    # Again, an instance of RegisterPurpose is created
    # just the same as you would for any Active
    # Record object.
    @register_purpose = RegisterPurpose.new(register_purpose_params)

    # The valid? method is also called just the same
    # as for any Active Record object.
    if @register_purpose.valid?

      # Instead of persisting the values to the
      # database, we're temporarily storing the
      # values in the session.
      full_params = register_purpose_params.merge(
        name: session['register_name']['name'],
        last_name: session['register_name']['last_name'],
        number: session['register_contact']['number'],
        temp: session['register_temp']['temp'],
      )
      first_name_var = session['register_name']['name']
      last_name_var = session['register_name']['last_name']

      full_register_name = "#{first_name_var} #{last_name_var}"

      # Here we finally carry out the ultimate objective:
      # creating a Register record in the database.
      Register.create!(full_params)

      @action_notice = "#{full_register_name} has been successfully saved. Welcome to NIPAM!"

      session.delete('register_name')
      session.delete('register_contact')
      session.delete('register_temp')

      redirect_to new_register_name_path, notice: @action_notice
    else
      render :new
    end
  end

  private

  # The strong params work exactly as they would
  # for an Active Record object.
  def register_purpose_params
    params.require(:register_purpose).permit(
      :purpose
    )
  end

  def set_purpose_list
    @purpose_list = ['Attending a conference','Attending a seminar','Attending a training programme','Meeting/Workshop','Official visit','Using Cafeteria','Library','Other']
  end
end

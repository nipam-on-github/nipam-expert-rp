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
      session[:register_purpose] = {
        'purpose' => @register_purpose.purpose
      }

      redirect_to users_path
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

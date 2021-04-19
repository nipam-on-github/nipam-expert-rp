class RegisterNamesController < ApplicationController
  def new
    # An instance of RegisterName is created just the
    # same as you would for any Active Record object.
    @register_name = RegisterName.new
  end

  def create
    # Again, an instance of RegisterName is created
    # just the same as you would for any Active
    # Record object.
    @register_name = RegisterName.new(register_name_params)

    # The valid? method is also called just the same
    # as for any Active Record object.
    if @register_name.valid?

      # Instead of persisting the values to the
      # database, we're temporarily storing the
      # values in the session.
      session[:register_name] = {
        'name' => @register_name.name,
        'last_name' => @register_name.last_name
      }

      redirect_to new_register_contact_path
    else
      render :new
    end
  end

  private

  # The strong params work exactly as they would
  # for an Active Record object.
  def register_name_params
    params.require(:register_name).permit(
      :name,
      :last_name
    )
  end
end

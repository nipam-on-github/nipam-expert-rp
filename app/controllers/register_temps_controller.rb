class RegisterTempsController < ApplicationController
  def new
    # An instance of RegisterTemp is created just the
    # same as you would for any Active Record object.
    @register_temp = RegisterTemp.new
  end

  def create
    # Again, an instance of RegisterTemp is created
    # just the same as you would for any Active
    # Record object.
    @register_temp = RegisterTemp.new(register_temp_params)

    # The valid? method is also called just the same
    # as for any Active Record object.
    if @register_temp.valid?

      # Instead of persisting the values to the
      # database, we're temporarily storing the
      # values in the session.
      session[:register_temp] = {
        'temp' => @register_temp.temp
      }

      redirect_to new_register_purpose_path
    else
      render :new
    end
  end

  private

  # The strong params work exactly as they would
  # for an Active Record object.
  def register_temp_params
    params.require(:register_temp).permit(
      :temp
    )
  end
end

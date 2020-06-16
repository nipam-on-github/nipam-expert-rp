class FacilityUsedsController < ApplicationController
  before_action :set_facility_used, only: [:show, :edit, :update, :destroy]

  # GET /facility_useds
  # GET /facility_useds.json
  def index
    @facility_useds = FacilityUsed.all
  end

  # GET /facility_useds/1
  # GET /facility_useds/1.json
  def show
  end

  # GET /facility_useds/new
  def new
    @facility_used = FacilityUsed.new
  end

  # GET /facility_useds/1/edit
  def edit
  end

  # POST /facility_useds
  # POST /facility_useds.json
  def create
    @facility_used = FacilityUsed.new(facility_used_params)

    respond_to do |format|
      if @facility_used.save
        format.html { redirect_to @facility_used, notice: 'Facility used was successfully created.' }
        format.json { render :show, status: :created, location: @facility_used }
      else
        format.html { render :new }
        format.json { render json: @facility_used.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /facility_useds/1
  # PATCH/PUT /facility_useds/1.json
  def update
    respond_to do |format|
      if @facility_used.update(facility_used_params)
        format.html { redirect_to @facility_used, notice: 'Facility used was successfully updated.' }
        format.json { render :show, status: :ok, location: @facility_used }
      else
        format.html { render :edit }
        format.json { render json: @facility_used.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facility_useds/1
  # DELETE /facility_useds/1.json
  def destroy
    @facility_used.destroy
    respond_to do |format|
      format.html { redirect_to facility_useds_url, notice: 'Facility used was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_facility_used
      @facility_used = FacilityUsed.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def facility_used_params
      params.require(:facility_used).permit(:facility, :visit_id)
    end
end

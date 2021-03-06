class DonationsController < ApplicationController
  before_action :set_donation, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  before_action :authenticate, only: [:edit, :create, :update, :destroy, :new]
  # GET /donations
  # GET /donations.json
  def index
    @donations = Donation.all
    @ratio = @donations.sort_by{|x|
      x.progress / x.total
    }.reverse!
  end

  # GET /donations/1
  # GET /donations/1.json
  def show
  end

  # GET /donations/new
  def new
    @donation = Donation.new
  end

  def add_custom
    @donation = Donation.find_by_incentive(params[:incentive])
    @value = params[:increment_amount]
    @request_key = params[:request_key]
    if @request_key == Rails.application.secrets.REQUEST_KEY
      @donation.increment!(:progress, @value.to_f)
    else
      render(:file => File.join(Rails.root, 'public/401'), :formats => [:html], :status => 401, :layout => false)
    end
  end

  # GET /donations/1/edit
  def edit
  end

  # POST /donations
  # POST /donations.json
  def create
    @donation = Donation.new(donation_params)

    respond_to do |format|
      if @donation.save
        format.html { redirect_to @donation, notice: 'Donation was successfullwy created.' }
        format.json { render :show, status: :created, location: @donation }
      else
        format.html { render :new }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /donations/1
  # PATCH/PUT /donations/1.json
  def update
    respond_to do |format|
      if @donation.update(donation_params)
        format.html { redirect_to @donation, notice: 'Donation was successfully updated.' }
        format.json { render :show, status: :ok, location: @donation }
      else
        format.html { render :edit }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /donations/1
  # DELETE /donations/1.json
  def destroy
    @donation.destroy
    respond_to do |format|
      format.html { redirect_to donations_url, notice: 'Donation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_donation
    @donation = Donation.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def donation_params
    params.require(:donation).permit(:progress, :total, :incentive, :image_url)
  end
end
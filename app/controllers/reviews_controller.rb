class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
    geocoder_result = Geocoder.search(request.remote_ip)
    #geocoder_result = Geocoder.search("152.208.23.252")
    if geocoder_result.empty? then
      @location = 'MI'
    else
      @location = geocoder_result.first.state_code
    end
    if @location == "" then
      @location = 'MI'
    end
    #@location = (geocoder_result.empty? || geocoder_result == "")  ? 'MI' : geocoder_result.first.state_code
  end

  # GET /reviews/1/edit
  def edit
  end

  def get_plate
  end

  def averages
    @qstate = params[:qstate]
    @qplate = params[:qplate]

    @qplate.upcase!
    (@qplate.delete!(' ')||'').gsub(/\D/)
    @turning = Review.where(:category => "Turning", :state => @qstate, :plate => @qplate ).average(:stars)
    @merging = Review.where(:category => "Merging", :state =>@qstate, :plate => @qplate ).average(:stars)
    @parking = Review.where(:category => "Parking", :state => @qstate, :plate => @qplate ).average(:stars)
    @speed = Review.where(:category => "Speed", :state => @qstate, :plate => @qplate ).average(:stars)
    @general = Review.where(:category => "General/Other", :state => @qstate, :plate => @qplate ).average(:stars)
    @overall = Review.where(:state=> @qstate, :plate => @qplate ).average(:stars)

=begin
    if overall.nil?
      render 'get_plate'
    end
=end
    #merging = Review.average(:stars).where(:category = Merging, :state = #{:state}", "plate = #{:plate}" )
    #parking = Review.average(:stars).where(:category = Parking, :state = #{:state}", "plate = #{:plate}" )
    #speed = Review.average(:stars).where(:category = Speed, :state = #{:state}", "plate = #{:plate}" )
    #general = Review.average(:stars).where(:category = General, :state = #{:state}", "plate = #{:plate}" )
    #overall = Review.average(:stars).where("state = #{:state}", "plate = #{:plate}" )
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to @review, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :show }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:state, :plate, :category, :stars)
    end


end

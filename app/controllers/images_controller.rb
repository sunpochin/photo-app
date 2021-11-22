class ImagesController < ApplicationController
  before_action :set_image, only: %i[ show edit update destroy ]

  # GET /images or /images.json
  def index
    @images = Image.all
  end

  # GET /images/1 or /images/1.json
  def show
  end

  # GET /images/new
  def new
    @image = Image.new
    # https://www.udemy.com/course/the-complete-ruby-on-rails-developer-course/learn/lecture/3853750#questions/3224868
    @image.user_id = current_user.id
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images or /images.json
  def create
    @image = Image.new(image_params)
    @image.user_id = current_user.id

    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: "Image was successfully created." }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /images/1 or /images/1.json
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @image, notice: "Image was successfully updated." }
        format.json { render :show, status: :ok, location: @image }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1 or /images/1.json
  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url, notice: "Image was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def image_params
      # params.require(:image).permit(:name, :picture, :user_id)
      # https://www.udemy.com/course/the-complete-ruby-on-rails-developer-course/learn/lecture/3853750#questions/3224868      
      params.require(:image).permit(:name, :picture).merge(user: current_user)

    end
end

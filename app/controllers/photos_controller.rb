class PhotosController < ApplicationController
  before_action :load_item, :except => :upload
  before_action :set_photo, :only => [:show, :edit, :update, :destroy]

  # GET /photos
  # GET /photos.json
  def index
    @photos = @item.photo.all
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
  end

  # GET /photos/new
  def new
    @photo = @item.photo.new
  end

  def new2

  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = @item.photo.new(photo_params.except(:attachment))
    uploaded_io = photo_params[:attachment]
        File.open(Rails.root.join('public', 'uploads',uploaded_io.original_filename), 'wb') do |file|
        file.write(uploaded_io.read)
        @photo.attachment = photo_params[:attachment].original_filename
      end
   	puts @photo.inspect 
    respond_to do |format|
      if @photo.save
        format.html { redirect_to "/items/"+@photo.item_id.to_s+"/photos/"+@photo.id.to_s, notice: 'Photo was successfully created.' }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  def upload
    uploaded_pics = params[:file] # Take the files which are sent by HTTP POST request.
    puts uploaded_pics.inspect
    time_footprint = Time.now.to_i.to_formatted_s(:number) # Generate a unique number to rename the files to prevent duplication
    uploaded_pics.each do |pic|
      puts "CHECK HERE!!"
      puts pic.inspect
      puts pic["0"].inspect
      File.open(Rails.root.join('public', 'uploads', pic["1"].original_filename), 'wb') do |file|
        file.write(pic["1"].read)
        File.rename(file, 'public/uploads/' + time_footprint + pic["1"].original_filename)
      end
    end
  end

  def create2

  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to "/items/"+@photo.item_id.to_s+"/photo/"+@photo.id.to_s, notice: 'Photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to "/items/"+@photo.item_id.to_s+"/photos/", notice: 'Photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = @item.photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:id,:name,:attachment,:featured)
    end
    
    def load_item
	@item = Item.find(params[:item_id])
    end
end

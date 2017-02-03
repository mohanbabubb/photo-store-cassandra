class ItemdetailsController < ApplicationController
  before_action :load_item
  before_action :set_itemdetail, only: [:show, :edit, :update, :destroy]

  # GET /itemdetails
  # GET /itemdetails.json
  def index
    @itemdetails = @item.itemdetail
  end

  # GET /itemdetails/1
  # GET /itemdetails/1.json
  def show
  end

  # GET /itemdetails/new
  def new
    @itemdetail = @item.itemdetail.new
  end

  # GET /itemdetails/1/edit
  def edit
  end

  # POST /itemdetails
  # POST /itemdetails.json
  def create
    @itemdetail = @item.itemdetail.new(itemdetail_params)
    #ho = { :make => "made", :year => "2003", "india" => ["sachin ten","virender","singh"] }
    #@itemdetail.data = ho
    #puts @itemdetail.id
    respond_to do |format|
      if @itemdetail.save
        #format.html { redirect_to [@item, @itemdetail], notice: 'Itemdetail was successfully created.' }
	puts @itemdetail.inspect	
        format.html { redirect_to "/items/"+@itemdetail.item_id.to_s+"/itemdetails/"+@itemdetail.id.to_s, notice: 'Itemdetail was successfully created.' }
        format.json { render :show, status: :created, location: @itemdetail }
      else
        format.html { render :new }
        format.json { render json: @itemdetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /itemdetails/1
  # PATCH/PUT /itemdetails/1.json
  def update
    respond_to do |format|
      if @itemdetail.update_attributes(itemdetail_params)
        format.html { redirect_to [@item, @itemdetail], notice: 'Itemdetail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @itemdetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /itemdetails/1
  # DELETE /itemdetails/1.json
  def destroy
    @itemdetail.destroy
    respond_to do |format|
      format.html { redirect_to item_itemdetails_url(@item), notice: 'Itemdetail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_itemdetail
      @itemdetail = @item.itemdetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def itemdetail_params
      params.require(:itemdetail).permit(:data,:id,:item_id)
    end
    
    def load_item
      @item = Item.find(params[:item_id])
    end
end

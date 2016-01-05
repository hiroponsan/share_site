class RentalsController < ApplicationController
  before_action :set_rental, only: [:show, :edit, :update, :destroy]
  before_action :set_product
before_action :authenticate_user!, only: [:new, :create]
  # GET /rentals
  # GET /rentals.json
  def index
    @rentals = Rental.all
  end

  # GET /rentals/1
  # GET /rentals/1.json
  def show
  end

  # GET /rentals/new
  def new
    @rental = current_user.rentals.build
    @product.rental_id = @rental.id
    if Rental.where(product_id: @product.id).present?
      @sold_out = "✴︎売り切れです" 
    end  
  end

  # GET /rentals/1/edit
  def edit
  end

  # POST /rentals
  # POST /rentals.json
  def create
    @rental = current_user.rentals.build(rental_params)
    @rental.product_id = @product.id

    respond_to do |format|
      if @rental.save
        format.html { redirect_to root_path, notice: 'Rental was successfully created.' }
        format.json { render :show, status: :created, location: @rental }
        @product.rental_id = @rental.id
      else
        format.html { render :new }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rentals/1
  # PATCH/PUT /rentals/1.json
  def update
    respond_to do |format|
      if @rental.update(rental_params)
        format.html { redirect_to @rental, notice: 'Rental was successfully updated.' }
        format.json { render :show, status: :ok, location: @rental }
      else
        format.html { render :edit }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rentals/1
  # DELETE /rentals/1.json
  def destroy
    @rental.destroy
    respond_to do |format|
      format.html { redirect_to rentals_url, notice: 'Rental was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rental
      @rental = Rental.find(params[:id])
    end

    def set_product
      @product = Product.find(params[:product_id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def rental_params
      params.permit(:product_id, :user_id, :rental_day)
    end
end

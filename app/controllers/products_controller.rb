class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:show, :index]

  # GET /products
  # GET /products.json

  def vote
    value = params[:type] == "up" ? 1 : -1
    @product = Product.find(params[:id])
    @product.add_or_update_evaluation(:votes, value, current_user) unless current_user.nil?
    redirect_to :back, notice: "评论成功!"
  end

  def index
    @products = Product.all

  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
    @comment = @product.comments.new
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product }
      else
        format.html { render action: 'new' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:title, :price, :description)
  end

  def add_new_comment
    @product = Product.find(params[:id])
    @product.comments << Product.new(params[:comment])
    redirect_to :action => :show, :id => product
  end
end

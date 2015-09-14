class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    @new_product = Product.new

    respond_to do |format|
      format.html
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    if @product.update_attributes(product_params)
        status = 'success'
        html = render_to_string partial: 'show', locals: {product: @product }
    else
        status = 'error'
    end

    render json: { status: status, data: @product, html: html}

  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    if @product.update_attributes(product_params)
        status = 'success'
    else
        status = 'error'
    end

    render json: { status: status, data: @product }
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    render json: { status: "success", data: @product}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name,:image, :image_cache, :remove_image)
    end
end

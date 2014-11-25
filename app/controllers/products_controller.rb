class ProductsController < ApplicationController
  def index
    @products = if params[:search]
      Product.where("LOWER(name) LIKE LOWER(?)", "%#{params[:search]}%")# SQL to allaw us to search for part of the word and receive the matching patterns of words back
    else
  	 Product.order('products.created_at DESC')
    end.page(params[:page])

    #to get our page to respond to ajax and need 'respond' ,so server can respond to something.
    respond_to do |format|
      format.html
      format.js
    end

    # @products = Product.order('products.created_at DESC').page(params[:page])
  end

  def show
  	@product = Product.find(params[:id])

    if current_user
      @review = @product.reviews.build
    end
  end

  def new
  	@product = Product.new
  end

  def edit
  	@product = Product.find(params[:id])
  end

  def create
  	@product = Product.new(product_params)

  	if @product.save
  		redirect_to products_url
  	else
  		render :new
  	end
  end

  def destroy
  	@product = Product.find(params[:id])
  	@product.destroy
  	redirect_to products_path
	end

	private
	def product_params
		params.require(:product).permit(:name, :description, :price_in_cents, :category)
	end
end

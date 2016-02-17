class ProductsController < ApplicationController
  def index
    @products = Category.select('*').joins(:products)

  end

  def show
    # @product = Product.display_product(params[:id])
     @product = Product.select('*').joins(:category).find(params[:id])
  end
  
  def new

  end

  def edit
    # @product = Product.display_product(params[:id])
     @product = Product.select('products.id, products.name, products.description, products.pricing, categories.cat_name, categories.id as cats_id').joins(:category).find(params[:id])
     # @product = Category.select('*').joins(:products).find(params[:id])

  end

  def create
    # @new_product = Product.create(product_params)
    new_product = Product.create(product_params)
    # cats = Category.select("id").find_by(cat_name: cat_params[:cat_name])
    @new_pro = Product.find(Product.last.id).update(category: Category.find_by(cat_params))
    # render :text => cat_params[:cat_name]
    redirect_to '/products/new'
  end

  def update
    @new_product = Product.find(params[:id]).update(name:params[:name],description:params[:description],pricing:params[:pricing], category: Category.select("id").find_by(cat_name:params[:cat_name]))
    # @up_pro = Product.find(params[:id]).update(category:Category.find_by(cat_name:params[:cat_name]))
    # render :text => 
    redirect_to '/products'
  end

  def destroy
    @product = Product.destroy_product(params[:id])
    redirect_to '/products'
  end

  private 
  def product_params
    params.require(:product).permit(:name, :description, :pricing)
  end
  def cat_params
    params.require(:product).permit(:cat_name)
  end
end



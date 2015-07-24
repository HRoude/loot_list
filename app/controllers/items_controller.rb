class ItemsController < ApplicationController
  
  def index
  	#@user = User.find(params[:user_id])
  	@item = current_user.items.all
  end
  	
  def new
  	@user = current_user
  	@item = current_user.items.new
  end

  def create
  	@item = current_user.items.create(item_params)
  end

  def edit
  	@item = current_user.items.find(params[:id])
  end

  def update
  	# @item = Item.find(params[:id])
  	# @item.update(item_params)
		@item = current_user.items.find(params[:id]).update
		redirect_to users_items_path(current_user)
  end

  def delete

  end

  private

		def item_params
			params.require(:item).permit(:item_name, :descrip, :comment, :price, :url_link, :image, :category, :want_rating)
		end	

end

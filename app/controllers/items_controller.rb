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
  	@item = current_user.items.create!(item_params)
	    if @item.persisted?
	      redirect_to user_items_path(@current_user), notice: "#{@item.item_name} has been added to your Want-It list."
	    else
	      render 'new'
	    end
  end

  def edit
  	@item = current_user.items.find(params[:id])
  	@user = current_user
  end

  def update
  	# @item = Item.find(params[:id])  
  	# can use items as collection as defined in model
		@item = current_user.items.find(params[:id]).update(item_params)
		redirect_to user_items_path(current_user)
  end

  def destroy
  	@item = current_user.items.find(params[:id])
  	@item.destroy
  	redirect_to user_items_path(current_user)
  end

  private

		def item_params
			params.require(:item).permit(:item_name, :descrip, :comment, :price, :url_link, :image, :category, :want_rating)
		end	

end

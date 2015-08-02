class ItemsController < ApplicationController
  
  def index
    @user = User.find(params[:user_id])
    @item = @user.items.all
  end
    
  def new
    @user = User.find(params[:user_id])   
    @item = @user.items.new
    if current_user.id != @item.user_id
      flash[:failure] = 'Not authorized to add an item to this item'
      redirect_to user_items_url
    end 
  end

  def create
    @user = User.find(params[:user_id])
    @item = @user.items.new
    if current_user.id == @item.user_id
      @item = @user.items.create!(item_params)  
      if @item.persisted?
        redirect_to user_items_url
        flash[:notice] = "#{@item.name} has been added to your Loot-List list."
      else
        render 'new'
      end
    else  
      flash[:failure] = 'Not authorized to add an item to this list'
      redirect_to user_items_url
    end  
  end

  def edit
    @user = User.find(params[:user_id])
    @item = @user.items.find(params[:id])
    if current_user.id != @item.user_id
      flash[:failure] = 'Not authorized to edit this item'
      redirect_to user_items_url
    else  
      @user = current_user
    end  
  end

  def update
    # @item = Item.find(params[:id])  can use items as collection as defined in model
    @user = User.find(params[:user_id])
    @item = @user.items.find(params[:id])
    if current_user.id != @item.user_id
      flash[:failure] = 'Not authorized to edit this item'
      redirect_to user_items_url
    else
      @item.update(item_params)
      redirect_to user_items_url
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @item = @user.items.find(params[:id])
    if current_user.id != @item.user_id
      flash[:failsure] = 'Not authorized to delete this item'
      redirect_to user_items_url
    else
      @item.destroy
      redirect_to user_items_url
    end
  end  

  private

    def item_params
      params.require(:item).permit(:name, :descrip, :comment, :price, :url_link, :image, :category, :want_rating)
    end 

end

class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.new(item_params)

    if @item.save
      flash[:notice] = "Item was saved."
      redirect_to root_path
    else
      flash.now[:alert] = "There was an error saving the item. Please try again."
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.name = params[:item][:name]

    if @item.save
      flash[:notice] = "Item was updated."
    else
      flash.now[:alert] = "There was an error saving the item. Please try again."
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])

    if @item.destroy
      flash[:notice] = "\"#{@item.name}\" was deleted successfully."
    else
      flash.now[:alert] = "There was an error deleting the item."
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end

end

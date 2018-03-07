class ItemsController < ApplicationController
  def show
    @wiki = Wiki.find(params[:id])
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new
    @item.title = params[:item][:title]
    @item.user_id = current_user[:id]

    if @item.save
      flash[:notice] = "Item was saved."
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
    @item.title = params[:item][:title]

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
      flash[:notice] = "\"#{@item.title}\" was deleted successfully."
    else
      flash.now[:alert] = "There was an error deleting the item."
    end
  end

end

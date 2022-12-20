class TreesController < ApplicationController
  before_action :set_tree, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index]

  def index
    @trees = Tree.all
  end

  def show
  end

  def new
    @tree = Tree.new
  end

  def create
    @tree = Tree.new(tree_params)
    @tree.user = current_user
    if @tree.save
      redirect_to root_path(@tree)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @tree.update(tree_params)
    redirect_to tree_path(@tree)
  end

  def destroy
    if Tree.find(@tree.id).user_id == current_user.id
      @tree.destroy
      redirect_to root_path, status: :see_other
    else
      flash[:alert] = "You are not authorized to delete this tree"
      render :show, status: :unauthorized
    end
  end

  private

  def tree_params
    params.require(:tree).permit(:name,
                                 :address,
                                 :description,
                                 :price_per_year,
                                 :fruits,
                                 :quantity_by_year)
  end

  def set_tree
    @tree = Tree.find(params[:id])
  end
end

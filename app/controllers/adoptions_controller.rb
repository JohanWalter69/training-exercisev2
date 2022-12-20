class AdoptionsController < ApplicationController
  before_action :set_tree, only: %i[create new]

  def index
    @adoptions = Adoption.all
  end

  def new
    @adoption = Adoption.new
  end

  def create
    @adoption = Adoption.new(adoption_params)
    @adoption.starts_at = DateTime.now
    @adoption.ends_at = DateTime.now.next_year.to_time
    @adoption.user_id = current_user.id
    @adoption.tree_id = @tree.id
    if @adoption.save
      redirect_to tree_path(@tree)
    else
      flash[:alert] = "An error occured"
      render :new
    end
  end

  private

  def adoption_params
    params.require(:adoption).permit(:name, :starts_at, :ends_at)
  end

  def set_tree
    @tree = Tree.find(params[:tree_id])
  end

end

class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.fine(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.saved
      redirect_to recipe_path(@recipe), notice: "投稿に成功しました。"
    else
      render :new
    end
  end

  def edit
  end
end

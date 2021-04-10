class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.create(recipe_id: params[:recipe_id])#current_userに結びついたいいねを作成
   #{@favorite = current_user} = @facorite.user_id = current_user.id   user_id = カラム
   #user_idを入れたら、あとはrecipe_idを入れるだけ
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @favorite = current_user.favorites.find_by(recipe_id: @recipe.id)
    #@recipeでrecipe_idを取ってきて、@favoriteにcurrent_user.idとrecipe_idを入れている
    @favorite.destroy
    redirect_back(fallback_location: root_path)
    #fallbackはもしも一つ前のurlが見つからなかったら、root_pathに遷移させる。もしかしたらのエラー回避で書いている。
  end

end

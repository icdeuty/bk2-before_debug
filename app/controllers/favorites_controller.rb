class FavoritesController < ApplicationController

	def create
		@favorite = Favorite.new(
			book_id: params[:book_id],
			user_id: current_user.id
		)
		@favorite.save
		redirect_to request.referer
		# redirect_to user_path(params[:book_id])
	end

	def destroy
		@favorite = Favorite.find_by(book_id: params[:book_id], user_id: current_user.id)
		# @favorite = current_user.favorites.find_by(book_id: @book.id)
		@favorite.destroy
		redirect_to request.referer
		# redirect_to user_path(params[:book_id])
	end

private
	def favorite_params
		params.require(:favorite).permit(:book_id, :user_id)
	end


	  # def user_params
	  #   params.require(:user).permit(:name, :introduction, :profile_image)
	  # end
end

class BookmarksController < ApplicationController
  def create
  	bookmark = current_user.bookmarks.build(post_id: params[:post_id])
  	bookmark.save!
  	redirect_to posts_path, success: t('.flash.bookmark')
  end

  def destroy
  	current_user.bookmarks.find_by(post_id: params[:post_id]).destroy!
  	redirect_to posts_path, success: t('.falsh.not_bookmark')
  end
end

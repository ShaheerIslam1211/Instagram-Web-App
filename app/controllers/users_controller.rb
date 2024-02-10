# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.search(params[:term])
    respond_to :js
  end

  def show
    @user = User.find(params[:id])
    set_meta_tags title: @user.name
    @posts = @user.posts.includes(:photos, :likes, :comments)
    return unless @user == current_user

    @saved = Post.joins(:bookmarks).where('bookmarks.user_id=?', current_user.id)
                 .includes(:photos, :likes, :comments)
  end
end

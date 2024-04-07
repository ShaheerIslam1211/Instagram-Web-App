# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: %i[show destroy]

  def index
    @posts = Post.paginate(page: params[:page], per_page: 5).includes(
      :photos, :user, :likes
    )
                 .order('created_at desc')
    @post = Post.new
  end

  def show
    @photos = @post.photos
    @likes = @post.likes.includes(:user)
    @comment = Comment.new
    @is_liked = @post.is_liked(current_user)
    @is_bookmarked = @post.is_bookmarked(current_user)
    set_meta_tags title: "Photo by #{@post.user.name}"
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      params[:images]&.each do |key, img|
        @post.photos.create(image: img)
      end
      redirect_to posts_path, notice: 'Saved ...'
    else
      flash[:alert] = 'Something went wrong ...'
      redirect_to posts_path
    end
  end

  def destroy
    if @post.user == current_user
      if @post.destroy
        flash[:notice] = 'Post deleted!'
      else
        flash[:alert] = 'Something went wrong ...'
      end
    else
      flash[:notice] = "You don't have permission to do that!"
    end
    redirect_to root_path
  end

  private

  def find_post
    @post = Post.find_by id: params[:id]

    return if @post

    flash[:danger] = 'Post not exist!'
    redirect_to root_path
  end

  def post_params
    params.require(:post).permit :content
  end
end


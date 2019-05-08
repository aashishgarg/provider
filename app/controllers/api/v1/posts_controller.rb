class Api::V1::PostsController < ApplicationController
  # --- Before Actions --- #
  before_action :set_post, except: %i[create index]

  def show
  end

  def index
    @posts = Post.all
  end

  def create
    @post = Post.create(post_params)
    render json: { errors: @post.errors }, status: :not_found unless @post.present?
    render 'show'
  end

  def update
    @post.update(post_params)
    render json: { errors: @post.errors }, status: :not_found unless @post.valid?
    render 'show'
  end

  def destroy
    render json: { errors: @post.errors }, status: :not_found unless @post.destroy
  end

  private

  def set_post
    @post = Post.find_by_id(params[:id])
    render json: { errors: { post: { errors: ['not found!'] } } }, status: :not_found unless @post
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end

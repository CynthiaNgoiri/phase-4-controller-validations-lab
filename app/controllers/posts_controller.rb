class PostsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_updated_post_not_valid

  def show
    post = find_post
    
    render json: post
  end

  def update
    post = find_post

    post.update!(post_params)

    render json: post
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

  def find_post
    Post.find(params[:id])
  end

  def render_updated_post_not_valid (invalid)
    render json: { errors: invalid.record.errors }, status: :unprocessable_entity

  end

end

class AuthorsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_new_author_not_valid
  
  def show
    author = Author.find(params[:id])

    render json: author
  end

  def create
    author = Author.create!(author_params)

    render json: author, status: :created
  end

  private
  
  def author_params
    params.permit(:email, :name)
  end

  def render_new_author_not_valid(invalid)
    render json: { errors: invalid.record.errors }, status: :unprocessable_entity

  end
  
  
end

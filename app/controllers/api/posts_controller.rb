class Api::PostsController < ApplicationController
    
  before_action :authenticate_user

  def index
    @posts = current_user.posts
    render "index.json.jb"
  end

  def show
    @post = Post.find_by(id: params[:id])
    if current_user.id == @post.user.id
      render "show.json.jb"
    else
      render json: {}, status: :unauthorized
    end
  end

  def create
    @post = Post.create({
      user_id: current_user.id,
      body: params[:body]
    })
    if @post.save
      render "show.json.jb"
    else
      render json: {errors: @post.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @post = Post.find_by(id: params[:id])
    if current_user.id == @post.user.id
      @post.body = params[:body] || @post.name
      if @post.save
        render "show.json.jb"
      else
        render json: {errors: @post.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {}, status: :unauthorized
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    if current_user.id == @post.user.id
      @post.destroy
      render json: {message: "Your post was destroyed"}
    else
      render json: {}, status: :unauthorized
    end
  end

end

class Api::PostsController < ApplicationController
    
  before_action :authenticate_user

  def index
    @posts = current_user.posts
    render "index.json.jb"
  end

  def show
    @post = current_user.posts.find_by(id: params[:id])
    render "show.json.jb"
  end

  def create
    @post = Post.create({
      user_id: current_user.id,
      body: params[:body]
    })
    if @post.save
      render "show.json.jb"
    else
      render json: {message: @post.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @post = current_user.posts.find_by(id: params[:id])
    @post.body = params[:body] || @post.name
    if @post.save
      render "show.json.jb"
    else
      render json: {message: @post.errors.full_messages}, status: :unprocessable_entity
    end 
  end

  def destroy
    @post = current_user.posts.find_by(id: params[:id])
    @post.destroy
    render json: {message: "Your product was destroyed!"}
  end
end

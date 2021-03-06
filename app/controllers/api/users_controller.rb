class Api::UsersController < ApplicationController

  before_action :authenticate_user, except: [:create]
  
  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      image_url: params[:image_url]
    )
    if @user.save
      render "show.json.jb"
    else
      render json: { errors: @user.errors.full_messages }, status: :bad_request
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    if current_user.id == @user.id
      render "show.json.jb"
    else
      render json: {}, status: :unauthorized
    end
  end

  def update
    user = params[:id]
    @user = User.find_by(id: user)
    if current_user.id == @user.id
      @user.name = params[:name] || @user.name
      @user.email = params[:email] || @user.email
      if params[:password]
        @user.password = params[:password]
        @user.password_confirmation = params[:password_confirmation]
      end
      @user.image_url = params[:image_url] || @user.image_url
      if @user.save
        render "show.json.jb"
      else
        render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {}, status: :unauthorized
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    if current_user.id == user.id
      variables = user.variables
      variables.each do |variable|
        entries = variable.entries
        entries.each do |entry|
          entry.destroy
        end
        variable.destroy
      end
      posts = user.posts
      posts.each do |post|
        post.destroy
      end
      user.destroy
      render json: {message: "Your user was destroyed!"}
    else
      render json: {}, status: :unauthorized
    end
  end

end

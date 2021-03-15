class Api::EntriesController < ApplicationController

  before_action :authenticate_user

  def create
    @entry = Entry.create(
      variable_id: params[:variable_id],
      value: params[:value],
      rating: params[:rating]
    )
    if @entry.save
      render "show.json.jb"
    else
      render json: { message: @entry.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @entry = Entry.find_by(id: params[:id])
    if current_user.id == @entry.variable.user.id
      @entry.value = params[:value] || @entry.value
      @entry.rating = params[:rating] || @entry.rating
      if @entry.save
        render "show.json.jb"
      else
        render json: { message: @entry.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: {}, status: :unauthorized
    end
  end

  def destroy
    @entry = Entry.find_by(id: params[:id])
    if current_user.id == @entry.variable.user.id
      @entry.destroy
      render json: { message: "Your entry was destroyed" }
    else
      render json: {}, status: :unauthorized
    end
  end
  
end

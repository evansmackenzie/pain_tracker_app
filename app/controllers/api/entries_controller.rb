class Api::EntriesController < ApplicationController

  before_action :authenticate_user

  def create
    @entry = Entry.create(
      variable_id: params[:variable_id],
      value: params[:value]
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
      if @entry.save
        render "show.json.jb"
      else
        render json: { message: @entry.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { message: "wrong user" }
    end
  end

  def destroy
    @entry = Entry.find_by(id: params[:id])
    if current_user.id == @entry.variable.user.id
      @entry.destroy
      render json: { message: "Your entry was destroyed" }
    else
      render json: { message: "wrong user" }
    end
  end
  
end

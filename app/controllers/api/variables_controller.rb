class Api::VariablesController < ApplicationController

  before_action :authenticate_user

  def index
    @variables = current_user.variables
    render "index.json.jb"
  end

  def show
    @variable = Variable.find_by(id: params[:id])
    if current_user.id == @variable.user.id
      render "show.json.jb"
    else
      render json: { message: "wrong user" }
    end
  end

  def create
    @variable = Variable.create(
      user_id: current_user.id,
      name: params[:name]
    )
    if @variable.save
      render "show.json.jb"
    else
      render json: {message: @variable.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @variable = Variable.find_by(id: params[:id])
    if current_user.id == @variable.user.id
      @variable.destroy
      render json: {message: "Your variable was destroyed!"}
    else
      render json: { message: "wrong user" }
    end
  end
end

class Api::VariablesController < ApplicationController

  before_action :authenticate_user

  def index
    @variables = current_user.variables
    render "index.json.jb"
  end

  def show
    @variable = current_user.variables.find_by(id: params[:id])
    render "show.json.jb"
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
    @variable = current_user.variables.find_by(id: params[:id])
    @variable.destroy
    render json: {message: "Your variable was destroyed!"}
  end
end

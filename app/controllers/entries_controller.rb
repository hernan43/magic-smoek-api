class EntriesController < ApplicationController
  before_action :set_project
  before_action :set_entry, only: [ :show, :update, :destroy ]

  def index
    @entries = @project.entries
    render json: @entries
  end

  def show
    render json: @entry
  end

  def create
    @entry = @project.entries.build(entry_params)

    if @entry.save
      render json: @entry, status: :created
    else
      render json: @entry.errors, status: :unprocessable_entity
    end
  end

  def update
    if @entry.update(entry_params)
      render json: @entry
    else
      render json: @entry.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @entry.destroy
    head :no_content
  end

  private

  def set_project
    @project = current_user.projects.find(params[:project_id])
  end

  def set_entry
    @entry = @project.entries.find(params[:id])
  end

  def entry_params
    params.require(:entry).permit(:title, :body)
  end
end

class BugsController < ApplicationController
  before_action :authenticate_user!

  def new
    @bug = Bug.new
  end

  def show
    @bug = Bug.find(params[:id])
  end

  def edit
      @bug = Bug.find(params[:id])
      puts @bug
      rescue ActiveRecord::RecordNotFound => e
        flash[:error] = "You are not allowed to edit this Bug."
        redirect_to project_url(params[:project_id])
  end
  def update
      @project = current_user.projects.find(params[:id])
      puts param
      @project.update_attributes(param)
      if @project.errors.full_messages.size > 0
        flash[:error] = @project.errors.full_messages.each {|m|}.join(". ")
        render 'edit'
      else
        flash[:notice] = 'Project Updated'
        redirect_to dashboard_index_url
      end
  end

  def create
    puts params
    @bug = Bug.create(param)
    if @bug.errors.full_messages.size > 0
      flash[:error] = @bug.errors.full_messages.each {|m|}.join(". ")
      render 'new'
    else
      @bug.save
      flash[:notice] = 'New '+param[:type]+' Added.'
      redirect_to project_url(session[:project_id])
    end
  end

  def destroy
    Bug.find(params[:id]).destroy
    flash[:notice] = 'Bug Removed Successfully'
    redirect_to project_url(session[:project_id])
  end

  def delete
  end

  private
    def param
      params.require(:bug).permit(:title, :description, :deadline, :screenshot, :status, :type, :user_id, :developer_id, :project_id)
    end
end

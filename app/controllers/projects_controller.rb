class ProjectsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!
  def new
      @project = Project.new
  end

  def show
  end

  def user
    @project = current_user.projects.find(params[:project_id])
    if @project.errors.full_messages.size > 0
      flash[:error] = @project.errors.full_messages.each {|m|}.join(". ")
      redirect_to project_url(@project)
    else
      ProjectsUser.create(project_id: params[:project_id],user_id: params[:test][:user_id]).save
      flash[:notice] = 'User Added to Project.'
      redirect_to project_url(@project)
    end
  end

  def remove_user
    ProjectsUser.where(' user_id = ? ',params[:id]).find_by_project_id(session[:project_id]).destroy
    flash[:notice] = 'User Removed.'
    redirect_to project_url(session[:project_id])
  end

  def create
    @project = current_user.projects.create(param)
    @project.user_id = current_user.id
    @project.save
    ProjectsUser.create(user_id: current_user.id, project_id: @project.id ).save
    if @project.errors.full_messages.size > 0
      flash[:error] = @project.errors.full_messages.each {|m|}.join(". ")
      render 'new'
    else
      flash[:notice] = 'New Project Created'
      redirect_to dashboard_index_url
    end
  end

  def edit
      @project = current_user.projects.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
        flash[:error] = "You are not allowed to edit this Project."
        redirect_to dashboard_index_url
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

  def delete

  end

  def destroy
    Project.find(params[:id]).destroy
    flash[:notice] = 'Project Deleted Successfully'
    render "dashboard/index"
  end
  private
    def param
      params.require(:project).permit(:user_id, :title, :description)
    end
end

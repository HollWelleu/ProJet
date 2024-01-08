class ProjectsController < ApplicationController

    def index

        @projects = Project.all

    end

    def show
        @project = Project.find(params[:id])
        @project_users = @project.users
        @project_tasks = @project.tasks
    end

    def new
        @project = Project.new
    end

    def create
        @project = Project.new(project_params)

        @project.users << current_user

        @users = params[:project][:user_ids]

        lead_devs = []

        lead_devs << params[:project][:lead_dev_ids]

        @users.delete_if { |user_id| user_id.empty? }

        lead_devs.delete_if { |user_id| user_id.empty? }

        if @users
            @users.each do |user_id|
                @project.users << User.find(user_id)
            end
        end

        if @project.save
            if lead_devs
                lead_devs.each do |user_id|
                    @project.projects_users.find_by(user_id: user_id).update(role: "Lead Developer")
                end
            end

            redirect_to home_index_path
        else
            render 'new'
        end
    end

    def edit
        @project = Project.find(params[:id])
    end

    def update
        @project = Project.find(params[:id])
        @project.update(project_params)
        redirect_to project_path(@project)
    end

    def destroy
        @project = Project.find(params[:id])
        @project.destroy
        redirect_to home_index_path
    end

    private

    def project_params
        params.require(:project).permit(:name, :description, :start_date, :end_date, :status, :user_ids => [], :lead_dev_ids => [])
    end

end

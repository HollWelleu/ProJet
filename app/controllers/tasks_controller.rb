class TasksController < ApplicationController

    before_action :set_project

    def index
        @tasks = @project.tasks
    end

    def new
        @task = @project.tasks.build
    end

    def create
        @task = @project.tasks.build(task_params)
        if @task.save
            redirect_to project_tasks_path(@project)
        else
            render :action => "new"
        end
    end

    def show
        @task = @project.tasks.find(params[:id])
    end

    def edit
        @task = @project.tasks.find(params[:id])
    end

    def update
        @task = @project.tasks.find(params[:id])
        if @task.update_attributes(task_params)
            redirect_to project_tasks_path(@project)
        else
            render :action => "edit"
        end
    end

    def destroy
        @task = @project.tasks.find(params[:id])
        @task.destroy
        redirect_to project_tasks_path(@project), notice: 'La tâche a été supprimée avec succès.'
    end

    private

    def set_project
        @project = Project.find(params[:project_id])
    end

    def task_params
        params.require(:task).permit(:name, :description, :done)
    end

end

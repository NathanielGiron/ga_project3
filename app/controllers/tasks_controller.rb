class TasksController < ApplicationController
  def index
  	@tasks = Task.all
  	@task = Task.new
  end

  def create
  	task = Task.create post_params do |p|
      p.save
    end
      redirect_to tasks_path
  end

  def new
  	    @task = Task.new
 	end
end

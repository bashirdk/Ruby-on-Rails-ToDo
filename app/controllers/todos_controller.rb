class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]

  # GET /todos
  # GET /todos.json
  # GET /todos?task=done
  # GET /todos?task=open
  def index
    if params[:task] == 'done'  
      # SELECT * FROM todos WHERE done = true
      @todos = Todo.where(done: true)
    elsif params[:task] == 'open' 
      # SELECT * FROM todos WHERE done = false 
      @todos = Todo.where(done: false)
    else
      # SELECT * FROM todos 
      @todos = Todo.all 
    end
  end

  # GET /todos/1
  # GET /todos/1.json
  def show
  end

  # GET /todos/new
  def new
    @todo = Todo.new
    @action = "new"
  end

  # GET /todos/1/edit
  def edit
    @action = "edit"
  end

  # POST /todos
  # POST /todos.json
  def create
    @todo = Todo.new(todo_params)

    respond_to do |format|
      if @todo.save
        format.html { redirect_to todos_path, :flash => { :success  => 'Task was successfully created.' } }
        format.json { render :show, status: :created, location: @todo }
      else
        format.html { render :new }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todos/1
  # PATCH/PUT /todos/1.json
  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to todos_path, :flash => { :info  => 'Task was successfully updated.' } }
        format.json { render :show, status: :ok, location: @todo }
      else
        format.html { render :edit }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todos/1
  # DELETE /todos/1.json
  def destroy
    @todo.destroy
    respond_to do |format|
      format.html { redirect_to todos_url, :flash => { :danger  => 'Task was successfully deleted.' } }
      format.json { head :no_content }
    end
  end

  # GET /complete/:id 
  def complete
    # SELECT * FROM todos WHERE id = :id 
    @todo = Todo.find(params[:id])
    @todo.update(done: true)
    respond_to do |format|
      format.html { redirect_to todos_path, :flash => { :success  => 'Task was successfully closed.' } } # flash is a general purpose map like a local variable map 
      format.json { head :no_content }
    end
  end

  def incomplete
    @todo = Todo.find(params[:id])
    @todo.update(done: false)
    respond_to do |format|
      format.html { redirect_to todos_path, :flash => { :info  => 'Task was successfully re-opened.' } } 
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_params
      params.require(:todo).permit(:task, :task_description)
    end
end
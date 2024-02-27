class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :set_categories, only: [:index]

  respond_to :json

  # GET /categories
  def index
    if @categories.empty?
      render json: { message: 'No Categories found.' }
    else
      respond_with @categories
    end
  end

  # GET /categories/1
  def show
    respond_with @category
  end

  # POST /categories/new
  def new
    @category = current_user.categories.build
  end

  def create
    @category = current_user.categories.build(category_params)
    
    if @category.save
      redirect_to @category, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  # PUT /categories/1/edit
  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to @category, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /categories/1
  def destroy
    @category = current_user.categories.find(params[:id])
    @category.tasks.each do |task|
      task.update(category_id: nil)
    end
    @category.destroy
    redirect_to categories_url, notice: 'Category was successfully destroyed.'
  end

  private

  def set_categories
    @categories = current_user.categories
  end
  
  def set_category
    @category = current_user.categories.find(params[:id])
  end

  def task_params 
    params.require(:task).permit(:category_id)
  end

  def category_params
    params.require(:category).permit(:title, :subtitle).merge(user_id: current_user.id)
  end
end

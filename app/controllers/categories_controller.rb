class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: %i[show edit update destroy]

  # GET /categories or /categories.json
  def index
    @categories = Category.all
    @user_email = current_user.email if user_signed_in?
  end

  # GET /categories/1 or /categories/1.json
  def show
    @category = Category.find(params[:id])
    @event_count = @category.events.count
  end

  # GET /categories/new
  def new
    @category = Category.new
    icons_json = File.read(Rails.root.join('app/assets/icons.json'))
    icon_data = JSON.parse(icons_json)
    @icon_choices = icon_data.map { |icon| ["#{icon['name']} - #{icon['emoji']}", icon['emoji']] }
  end

  # GET /categories/1/edit
  def edit
    @icon_choices = icon_choices_for_form
  end

  def icon_choices_for_form
    icons_json = File.read(Rails.root.join('app/assets/icons.json'))
    icon_data = JSON.parse(icons_json)
    icon_data.map { |icon| ["#{icon['name']} - #{icon['emoji']}", icon['emoji']] }
  end

  # POST /categories or /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html do
          redirect_to category_url(@category),
                      notice: "Category #{@category.name} was recently created by
                      #{current_user.email} at #{Time.now.strftime('%B %e, %Y %H:%M:%S')}"
        end
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html do
          redirect_to category_url(@category),
                      notice: "Category was recently updated to #{@category.name} 
                      by #{current_user.email} at #{Time.now.strftime('%B %e, %Y %H:%M:%S')}"
        end
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category.destroy!

    respond_to do |format|
      format.html do
        redirect_to categories_url,
                    notice: "Category  #{@category.name} was recently deleted
                    by #{current_user.email} at #{Time.now.strftime('%B %e, %Y %H:%M:%S')}"
      end
      format.json { head :no_content }
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :description, :icon)
  end
end

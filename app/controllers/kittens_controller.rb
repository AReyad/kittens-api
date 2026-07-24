class KittensController < ApplicationController
  before_action :set_kitten, only: [ :show, :edit, :update, :destroy ]
  def show
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.create(kitten_params)
    if @kitten.save
      flash[:success] = "Kitten created successfully."
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end


  def edit; end

  def update
    if @kitten.update(kitten_params)
      flash[:success] = "Kitten updated successfully."
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @kitten.destroy
    flash[:success] = "Kitten destroyed successfully."
    redirect_to root_path
  end


  def index
    @kittens = Kitten.all
    respond_to do |format|
      format.html
      format.json { render json: @kittens }
    end
  end

  private

  def kitten_params
    params.expect(kitten: [ :name, :age, :softness, :cuteness ])
  end

  def set_kitten
    @kitten = Kitten.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @kitten }
    end
  end
end

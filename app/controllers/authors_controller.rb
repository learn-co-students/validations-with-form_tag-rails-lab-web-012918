class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :edit, :update]
  def show
  end

  def new
    @author = Author.new
  end

  def edit
    render :new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      redirect_to author_path(@author)
    else
      render :new
    end
  end

  def update
    @author.assign_attributes(author_params)
    if @author.save
      redirect_to author_path(@author)
    else
      render :new
    end
    redirect_to author_path(@author)
  end

  private

  def author_params
    params.permit(:name, :email, :phone_number)
  end

  def set_author
    @author = Author.find(params[:id])

  end
end

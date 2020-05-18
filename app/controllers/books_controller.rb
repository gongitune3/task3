class BooksController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def ceate
    @books = Book.new
  end

  def edit
  end
end

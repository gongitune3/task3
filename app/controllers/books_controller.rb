class BooksController < ApplicationController
  
  def top
  end

  def about
  end
  
  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
  end

  def create
      @book = Book.new(book_params)
      @book.user_id = current_user.id
      if  @book.save
          flash[:notice] = "successfully"
          redirect_to book_path(@book)
      else
          @books = Book.all
          render :index
      end
  end

  def edit
    @book = Book.find(params[:id])
    if  @book.user_id != current_user.id
        redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to @book
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to new_book_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end

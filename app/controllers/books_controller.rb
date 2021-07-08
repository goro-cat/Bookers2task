class BooksController < ApplicationController
 before_action :ensure_correct_user, only: [:update, :edit]
 #onlyなくて大丈夫

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])##コメントのshowの時も使用
    @user = @book.user
    @book_comment = BookComment.new
    @comments = @book.book_comments.all
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      @books = Book.all
      render 'index'
    end
  end

  def edit
   # @book = Book.find(params[:id])なくても大丈夫
  end



  def update
   # @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    #@book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def user_params
    params.reauire(:user).permit(:name, :introduction, :profile_image_id)
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

  def ensure_correct_user
    @book = Book.find(params[:id])
    unless @book.user == current_user
      redirect_to books_path
    end
  end

end

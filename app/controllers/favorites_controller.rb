class FavoritesController < ApplicationController

  def create
    book = Book.find(params[book_params_id])
    favorite = current_user.favorites.new(book_id: book.id)
    favorite.save(favorite_params)
    redirect_to books_path
  end

  def destroy
    book = Book.find(params[book_params_id])
    favorite = current_user.favorites.find_by(book_id: book.id)
    favorite.destroy
    redirect_to books_path
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def favorite_params
    params.require(:favorite).permit()
  end

end

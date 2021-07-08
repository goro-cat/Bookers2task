class BookCommentsController < ApplicationController

  ##表示場所はbook#index book#showのためviewなし

  def create
    book = Book.find(params[:book_id])
    @comment = current_user.book_comments.new(book_comment_params)
    ##上記は下記と同義
    #comment = BookComment.new(book_comment_params)
    #comment.user_id = current_user.id
    @comment.book_id = book.id
 
    if @comment.save
      format.html { redirect_back(fallback_location: book_path(book))}
      format.js##creat.js.erbに繋がる
    else
      format.html { redirect_back(fallback_location: book_path(book))}
    end
  end

  def destroy
    BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    redirect_back(fallback_location: book_path(params[:book_id]))
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end

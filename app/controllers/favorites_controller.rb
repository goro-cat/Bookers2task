class FavoritesController < ApplicationController
 before_action :authenticate_user!
 
  def create
    @book = Book.find(params[:book_id])##親子関係のbookのパラメータをさがしてくる
   
    favorite = current_user.favorites.new(book_id: @book.id)##book.idがさっき見つけてきたbook.id。favariteの定義文
    favorite.save
    #redirect_to request.referer・非同期通信時、記述なければcreate.js.erbに勝手にいくため記述なくす
  end

  def destroy
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: book.id)
    favorite.destroy
    redirect_to request.referer
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end



end

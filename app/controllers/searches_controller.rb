class SearchesController < ApplicationController

  def search
   # @posts = Post.search(params[:keyword])##keywordを送る
    @keyword = params[:keyword]
    render "index"
  end

  def index
    # Hash
    # {"utf8"=>"✓", "keyword"=>"test", "model"=>"User", "search_way"=>"1", "commit"=>"検索"}
    # params
    @keyword = params[:keyword]

    if params[:model] == "User"
        if params[:search_way] == "1"
            @posts = User.where('name like ?', "#{@keyword}")
          
        elsif params[:search_way] == "2"
            #モデル名.where('カラム名 like ?','検索したい文字列%')前方一致
            @posts = User.where('name like ?', "#{@keyword}%")
        elsif params[:search_way] == "3"
            @posts = User.where('name like ?', "%#{@keyword}")
        elsif params[:search_way] == "4"
            @posts = User.where('name like ?', "%#{@keyword}%")
        end
        

    elsif params[:model] == "Book"
        if params[:search_way] == "1"
           # where(["title like? OR body like?", "%#{keyword}%", "%#{keyword}%"])
            @posts = Book.where(['title like? OR body like?', "#{@keyword}", "#{@keyword}"])

        elsif params[:search_way] == "2"
            @posts = Book.where('title like? OR body like?', "#{@keyword}%", "#{@keyword}%")
        elsif params[:search_way] == "3"
            @posts = Book.where('title like? OR body like?', "%#{@keyword}", "%#{@keyword}")
        elsif params[:search_way] == "4"
            @posts = Book.where('title like? OR body like?', "%#{@keyword}%", "%#{@keyword}%")
        end
    end



    # @posts = .search(params[:keyword])##keywordを送る


  end



end

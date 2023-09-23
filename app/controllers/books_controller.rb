class BooksController < ApplicationController
  def new
    #Viewへ渡すためのインスタンス変数に空のModelオブジェクトを作成する。
    @book = Book.new
  end
  
  def create
    #データを受け取り新規登録するためのインスタンス作成
    book = Book.new(book_params)
    book.save
    redirect_to books_path(book.id)
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  
end

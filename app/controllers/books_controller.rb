class BooksController < ApplicationController
  def new
    #Viewへ渡すためのインスタンス変数に空のModelオブジェクトを作成する。
    @book = Book.new
  end

  def create
    #データを受け取り新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    if @book.save
      flash[:notice]="Book was successfully created"
      redirect_to book_path(@book.id)
    else
      flash.now[:notice]="Book was not successfully created"
      @books=Book.all
      render :index
    end
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
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice]="Book was successfully updated"
      redirect_to book_path(@book)
    else
      flash.now[:notice]="Updated error"
      @book=Book.find(params[:id])
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    if @book.destroy
      flash[:notice]="Book was successfully deleted"
    else
      flash[:alert]="Error deleted"
    end
      redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end


end

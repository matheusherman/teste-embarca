class BooksController < ApplicationController
  #criar rotas
  #
  skip_before_action :verify_authenticity_token
  before_action :set_book, only: [:show, :edit, :update, :destroy]
 # validar os dados antes de fazer o salvamento (callback)
  
  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to @book, notice: "Book criado com sucesso." # se der boa joga 200 e uma mensgem de sucesso
    else
      render :new, status: :unprocessable_entity # se der erro joga 422
    end
  end


  def update
    if @book.update(book_params)
      redirect_to @book, notice: "Book atualizado com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    @book.destroy
  end

  def set_book
    @book = Book.find(params[:id]) #find ou find_by
  end

  def book_params
    params.require(:book).permit(:title, :author, :notes, :finished_on, :status, :user_id)
  end

end

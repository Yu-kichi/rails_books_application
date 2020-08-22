# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]
  before_action :set_locale

  def index
    @books = Book.page(params[:page]).per(10) # マジックナンバーになる。。
    @time = Time.now
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
      redirect_to @book, notice: t("directory.flash.create")
    else
      render :new
    end
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: t("directory.flash.update")
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_url, alert: t("directory.flash.destroy")
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :memo, :author, :picture)
    end
end

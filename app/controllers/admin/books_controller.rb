class Admin::BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
    @page_title = 'Listing books'
    sort_by = params[:sort_by]
    @books = Book.paginate(:page => params[:page], :per_page => 10)
    .order(sort_by)
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book = Book.find(params[:id])
    @page_title = "#{@book.title}"
    
    respond_to do |format|
      format.html # show.html.erb
        format.json { render json: @book }
    end
  end

  # GET /books/new
  def new
    load_data
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
    load_data
    @book = Book.find(params[:id])
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        load_data
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  

  private
    def load_data
      @authors = Author.all
      @publishers = Publisher.all
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :publisher_id, :published_at, :isbn,
        :blurb, :price, :created_at, :updated_at, :cover_image,
        :page_count, {:author_ids => []})
    end

    
end

class BooksController < ApplicationController

  def index
    @books = Book.all

    respond_to do |format|
      format.html
      format.text
      format.csv { render plain: Book.generate_csv(@books)}
      format.json do
        json_data = @books.map { |book|

        {title: book.title,
         author: book.author,
         already_read: book.already_read}
        }
        render json: json_data
      end
    end
  end
end

class Book
  attr_accessor :times_read, :current_page, :title

  def initialize(title)
    @times_read = 0
    @current_page = 1
    @title = title
  end

  def finish
    @times_read += 1
    @current_page = 1
  end

  def flip_page
    @current_page +=1
  end

  def read?
    @times_read > 0
  end
end
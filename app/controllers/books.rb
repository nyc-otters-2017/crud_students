

get '/books' do
  require_user
  @books = current_user.books
  erb :'/books/index'
end

get '/books/new' do
  # require_user
  erb :'/books/new'
end

get '/books/:id' do
  @books = Book.all
  erb :'/books/index'
end


get '/students/:id/books' do
  student = Student.find(params[:id])
  @books = student.books
  erb :'/books/index'
end

post '/books' do
  book = current_user.books.new(params[:book])
  if book.save
    redirect '/books'
  else
    @errors = book.errors.full_messages
    erb :'/books/new'
  end
end



#
# get '/users/new' do
#
# end
#
#
# get '/users/:id' do
#
# end

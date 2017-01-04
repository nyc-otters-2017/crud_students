get '/students' do
  @students = Student.all
  erb :'/students/index'
end


get '/students/new' do
  erb :'/students/new'
end

post '/students' do
  # binding.pry
  @student = Student.new(params[:student])
  if @student.save
    redirect '/students'
  else
    @errors = @student.errors.full_messages
    erb :'/students/new'
  end
end

get '/students/:id/edit' do
  @student = Student.find(params[:id])
  erb :'/students/edit'
end

put '/students/:id' do
  @student = Student.find(params[:id])
  if @student.update(params[:student])
    redirect '/students'
  else
    @errors = @student.errors.full_messages
    erb :'students/edit'
  end
end


get '/students/:id/books'
end

delete '/students/:id'
end
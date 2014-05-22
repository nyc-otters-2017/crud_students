get '/:word' do
  @word = params[:word]

  # Look in app/views/anagrams/index.erb
  erb :"anagrams/index"
end

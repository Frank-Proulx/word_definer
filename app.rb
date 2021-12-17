require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @words = Word.all
  erb(:words)
end

get('/words') do
  @words = Word.all
  erb(:words)
end

get('/words/new') do
  erb(:new_word)
end

post('/words') do
  word = params[:word]
  word = Word.new({:word => word, :id => nil})
  word.save()
  redirect to('/words')
end

get('/words/:id') do
  @word = Word.find(params[:id].to_i())
  erb(:word)
end

post('/words/:id/definitions') do
  @word = Word.find(params[:id].to_i())
  definition = Definition.new({:definition => params[:definition], :word_id => @word.id, :id => nil})
  definition.save()
  erb(:word)
end
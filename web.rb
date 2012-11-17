require 'rubygems'
require 'sinatra'
require 'data_mapper'

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/todo_list.db")
class Item
  include DataMapper::Resource
  property :id, Serial
  property :content, Text, :required => true
  property :done, Boolean, :required => true, :default => false
  property :created, DateTime
end
DataMapper.finalize.auto_upgrade!

get '/' do
  @items = Item.all(:order => :created.desc)
  if @items.size == 0
    redirect '/new'
  end
  erb :index
end

get '/new' do
  
end

post '/new' do
  
end
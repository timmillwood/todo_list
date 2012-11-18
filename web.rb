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

get '/?' do
  @items = Item.all(:order => :created.desc)
  redirect '/new' if @items.empty?
  erb :index
end

get '/new/?' do
  @title = "Add todo item"
  erb :new
end

post '/new/?' do
  Item.create(:content => params[:content], :created => Time.now)
  redirect '/'
end
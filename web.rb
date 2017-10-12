require 'sinatra'
require 'data_mapper' # metagem, requires common plugins too.

# need install dm-sqlite-adapter
DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/blog.db")

class Post
    include DataMapper::Resource
    property :id, Serial
    property :title, String
    property :body, Text
    property :created_at, DateTime
end

# Perform basic sanity checks and initialize all relationships
# Call this when you've defined all your models
DataMapper.finalize

# automatically create the post table
Post.auto_upgrade!

get '/new' do
	erb :new
end

post '/create' do
	#replace this
	return params.to_s
end

get '/' do
	#load all posts
	#display them
	@title = "All posts"
	@headline = "My life in blog"
	@paragraph = "Follow me plz. Follow 4 Follow."
	@posts = Post.all


	erb :index
end
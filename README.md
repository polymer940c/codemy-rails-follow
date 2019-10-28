#init

`rails new app-name -d postgresql`



# create the db
`rake db:create`
# we can use this command to generate models in our app
rails generate model post title:string body:text
rake db:migrate



# this will generate the posts_controller.rb
rails g controller posts


# set up post index

app/controllers/posts_controller.rb
```
  def index
    @posts = Post.all
  end
```
app-name/app/views/posts/index.haml
```
- @posts.each do |post|
  %h2= post.title
  %p= post.body
  %p= post.created_at
  %hr/
```



# bootstrap
gem 'bootstrap-sass', '~> 3.4.1'
gem 'sassc-rails', '>= 2.1.0'


application.css -> application.scss
application.js -> application.coffee


# CRUD for Post



# one to many: comment to post

rails g model comment body:text post:references

app-name/app/models/comment.rb
class Comment < ApplicationRecord
  belongs_to :post
end

app-name/app/models/post.rb
class Post < ApplicationRecord
  has_many :comments
end

rake db:migrate


# routes for comments

app-name/config/routes.rb
comments is nested inside posts


rails g controller comments


# many to many relationship 
a post  can have        many tags 
a tag   can belongs-to  many posts
create a join table (tagging) 
  - belongs to tag
  - belongs to post

add these two lines to each of the model( post + tag )
model/tag.rb
has_many :taggings
has_many :posts, through: :taggings 
model/post.rb
has_many :taggings
has_many :tags, through: :taggings 

you want to be able to get all posts that uses a tag
you wnat to be able to get all tags form a post

rails g model tag name:string
rails g model tagging post:references tag:references




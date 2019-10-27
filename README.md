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

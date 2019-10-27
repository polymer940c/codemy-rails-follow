#init

`rails new app-name -d postgresql`

# create the db
`rake db:create`
# we can use this command to generate models in our app
rails generate model post title:string body:text
rake db:migrate




# this will generate the posts_controller.rb
rails g controller posts

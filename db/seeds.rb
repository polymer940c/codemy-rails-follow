Comment.all.each { |comment| comment.destroy }
Post.all.each { |post| post.destroy }
Tag.all.each { |tag| tag.destroy }

puts "Post destroy"
puts "Comment destroy"
puts "Tag destroy"

tags = [] 
5.times do |i|
  tags << Tag.create( 
    name: Faker::TvShows::RickAndMorty.character
  )
end

10.times do |i| 
  post = Post.create( 
    title: Faker::TvShows::RickAndMorty.location,
    body: Faker::TvShows::RickAndMorty.quote + " " + 
          Faker::TvShows::RickAndMorty.quote + " " + 
          Faker::TvShows::RickAndMorty.quote
  )
  print "P#{i} "

  (rand 0..5).times do |i|
    post.comments.create( 
      body: Faker::TvShows::RickAndMorty.quote
    )
  end
  print "C#{i} "

  post.tags = tags.sample(rand 0..5)
  post.save
  
end




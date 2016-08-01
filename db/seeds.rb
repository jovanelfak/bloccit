require 'random_data'
 15.times do
   Topic.create!(
     name:         RandomData.random_sentence,
     description:  RandomData.random_paragraph
   )
 end
 topics = Topic.all

 50.times do
  SponsoredPost.create!(
    topic: topics.sample,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
    price: rand(55..100)
  )
end
sponsored_posts = SponsoredPost.all




50.times do
	Post.create!(
		topic: topics.sample,
		title: RandomData.random_sentence,
		body: RandomData.random_paragraph
		)	
end
posts = Post.all


puts "Seed finished"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{SponsoredPost.count} sponsored posts created"
puts "#{Comment.count} comments created"

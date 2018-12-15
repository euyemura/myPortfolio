3.times do |topic|
  Topic.create!(
    title: "Topic #{topic}"
  )
end

puts "3 topics created!"


10.times do |blog|
  Blog.create!(
    title: "Blog #{blog}",
    body: "Everyone wants to enjoy the good parts - but you have to build the framework first. Give him a friend, we forget the trees get lonely too. If you didn't have baby clouds, you wouldn't have big clouds. We'll take a little bit of Van Dyke Brown. Let's build some happy little clouds up here. Almost everything is going to happen for you automatically - you don't have to spend any time working or worrying.",
    topic_id: Topic.last.id
  )
end

puts "10 blog posts created"

5.times do |skill|
  Skill.create!(
    title: "Rails #{skill}",
    percent_utilized: 10
  )
end

puts "5 skills generated"

8.times do |portfolio|
  message = "Ruby on Rails"
  message = "Angular" if portfolio == 7
  Portfolio.create!(
    title: "Portfolio #{portfolio}",
    subtitle: message,
    body: "Do an almighty painting with us. You've got to learn to fight the temptation to resist these things. Just let them happen. Be careful. You can always add more - but you can't take it away.",
    main_image: "https://placeimg.com/600/400/nature",
    thumb_image: "https://placeimg.com/150/100/nature"
  )
end

puts "9 portfolio items created"

3.times do |technology|
  Portfolio.last.technologies.create!(name: "Technology #{technology}")
  # Technology.create!(
  #   name: "Technology #{technology}",
  #   portfolio_id: technology+1
  # )
end

puts "3 technologies created"

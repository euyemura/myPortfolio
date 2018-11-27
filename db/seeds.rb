10.times do |blog|
  Blog.create!(
    title: "Blog.#{blog}",
    body: "Everyone wants to enjoy the good parts - but you have to build the framework first. Give him a friend, we forget the trees get lonely too. If you didn't have baby clouds, you wouldn't have big clouds. We'll take a little bit of Van Dyke Brown. Let's build some happy little clouds up here. Almost everything is going to happen for you automatically - you don't have to spend any time working or worrying."
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

9.times do |portfolio|
  Portfolio.create!(
    title: "Portfolio #{portfolio}",
    subtitle: "My great service",
    body: "Do an almighty painting with us. You've got to learn to fight the temptation to resist these things. Just let them happen. Be careful. You can always add more - but you can't take it away.",
    main_image: "https://placeimg.com/600/400/nature",
    thumb_image: "https://placeimg.com/150/100/nature"
  )
end

puts "9 portfolio items created"

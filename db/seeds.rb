# frozen_string_literal: true

3.times do |topic|
  Topic.create!(
    title: "Topic #{topic}"
  )
end

10.times do |blog|
  Blog.create!(
    title: "My Blog Post #{blog + 1}",
    body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    topic_id: blog.even? ? Topic.last.id : Topic.first.id
  )
end

puts '10 blog posts created!'

5.times do |skill|
  Skill.create!(
    title: "The #{skill + 1} skill",
    percent_utilized: rand(100)
  )
end

puts '5 skills created!'

7.times do |portfolio_item|
  Portfolio.create!(
    title: "#{portfolio_item + 1} project",
    subtitle: "#{portfolio_item + 1} subtitle",
    body: "#{portfolio_item + 1} Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor .",
    main_image: 'http://via.placeholder.com/600x400',
    thumb_image: 'http://via.placeholder.com/300x200'
  )
end

Portfolio.create!(
  title: 'React project',
  subtitle: 'React',
  body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor .',
  main_image: 'http://via.placeholder.com/600x400',
  thumb_image: 'http://via.placeholder.com/300x200'
)

Portfolio.create!(
  title: 'Ruby on Rails project',
  subtitle: 'Ruby on Rails',
  body: '#Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor .',
  main_image: 'http://via.placeholder.com/600x400',
  thumb_image: 'http://via.placeholder.com/300x200'
)

puts '9 portfolio items created!'

4.times do |technology|
  if technology.even?
    Portfolio.first.technologies.create!(name: "Technology #{technology}")
  else
    Portfolio.last.technologies.create!(name: "Technology #{technology}")
  end
end

puts '4 technologies created!'

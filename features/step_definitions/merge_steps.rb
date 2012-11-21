When /^(?:|I )fill in "([^"]*)" with "([^"]*)"'s ID$/ do |field, value|
  article_id = Article.find_by_title(value).id
  fill_in(field, :with => article_id)
end

And /^"([^"]*)"'s "([^"]*)" should be "([^"]*)"$/ do |title, field, author|
  article_author = Article.find_by_title(title).author
  assert article_author == author
end

And /^I add a publisher$/ do
  User.create!({:login => 'Blogger',
                :password => 'password',
                :email => 'blogger@outlook.com',
                :profile_id => 10,
                :name => 'Blogger',
                :state => 'active'})
end

And /^I am logged in as the publisher$/ do
  visit '/accounts/login'
  fill_in 'user_login', :with => 'Blogger'
  fill_in 'user_password', :with => 'password'
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end
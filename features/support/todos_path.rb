Given(/^I am login as New User$/) do
  # pending # express the regexp above with the code you wish you had
  @user = User.create( email: "abc@zoomcar.com", password: Devise.friendly_token )
  visit root_url
  fill_in "user_email",:with=>@user.email
  fill_in "user_password",:with=>@user.password
  click_button "Log in"
  print page.html
end




# Given(/^I am New User$/) do
#   # pending # express the regexp above with the code you wish you had
#   @user = User.create( email: "aaf@adfd.com", password: Devise.friendly_token )
#   # sign_in @user
# end
# 
# When(/^I go to the my home page$/) do
#   # pending # express the regexp above with the code you wish you had
#   visit root_url
# end
# 
# 
# Then(/^I should see (\d+) todos in  table$/) do |count|
#   print page.html
#   @user.todos.count ==count.to_i
# end

Given(/^I am existing user$/) do
  # pending # express the regexp above with the code you wish you had
  # @current_user = User.create( email: "aaf@adfd.com", password: Devise.friendly_token )
  @count=@user.todos.count
  todos_index_path
end

Given(/^I have No todo$/) do
  # pending # express the regexp above with the code you wish you had
  @user.todos.delete_all
end
When(/^I Click on "(.*?)" Link$/) do |link|
  # click_on(link)
  visit  todos_new_path  
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |field, value|
  fill_in field,with: value  # fill_in(field.gsub(' ', '_'), :with => value)
  
end

When(/^I click on  "(.*?)" button$/) do |button|
  save_and_open_page
  click_button(button)
  
  
end

Then(/^(\d+) more  Todo should be shown in table on Home Page$/) do |count|
  # pending # express the regexp above with the code you wish you had
  @user.todos.count-@count==1
  # save_and_open_page
  #  puts page.body
end






Feature: Manage Todo
In order to make a Todo app
As an User
I want to create and  manage todos

Background:
Given I am login as New User

# Scenario: Todo List
# Given I am New User
# When I go to the my home page
# Then I should see 0 todos in  table
@focus
Scenario: Create Valid Todo
Given I am existing user
And I have No todo
When I Click on "ADD NEW TODO" Link
And I fill in "todo_todo_item" with "sample todo"
And I fill in "todo_start_date" with "2015-09-11"
And I fill in "todo_end_date" with "2015-09-16"
And I click on  "Add todo" button
Then 1 more  Todo should be shown in table on Home Page
